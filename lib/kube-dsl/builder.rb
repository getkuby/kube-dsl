# typed: false

require 'json'

module KubeDSL
  class Builder
    attr_reader :schema_dir, :output_dir, :autoload_prefix
    attr_reader :dsl_namespace, :entrypoint_namespace
    attr_reader :inflector, :resolvers, :serialize_handlers

    def initialize(schema_dir:, output_dir:, autoload_prefix:, inflector:, dsl_namespace:, entrypoint_namespace:)
      @schema_dir = schema_dir
      @output_dir = output_dir
      @autoload_prefix = autoload_prefix
      @inflector = inflector
      @dsl_namespace = dsl_namespace
      @entrypoint_namespace = entrypoint_namespace
      @resolvers = {}
      @serialize_handlers = []
      @resources = nil
    end

    def register_resolver(*prefixes, &resolver)
      prefixes.each do |prefix|
        @resolvers[prefix] = resolver
      end
    end

    def register_serialize_handler(namespace, version, kind, field, &block)
      @serialize_handlers << SerializeHandler.new(
        namespace, version, kind, field, &block
      )
    end

    def each_resource_file
      return to_enum(__method__) unless block_given?

      each_resource do |res|
        yield File.join(output_dir, res.ref.ruby_autoload_path), res
      end
    end

    def entrypoint(&block)
      EntrypointBuilder.new(self, &block)
    end

    def each_autoload_file(&block)
      return to_enum(__method__) unless block

      each_autoload_file_helper(
        autoload_map[:root], [], &block
      )
    end

    def resource_from_ref(ref)
      if res = resource_cache[ref.str]
        return res
      end

      res = resource_cache[ref.str] = ref.meta
      add_doc_to_resource(res, ref.document)

      res
    end

    def parse_ref(ref_str)
      Ref.new(ref_str, dsl_namespace, inflector, schema_dir, autoload_prefix, serialize_handlers)
    end

    def each_resource
      return to_enum(__method__) unless block_given?

      load_resources unless @resources

      @resources.each do |res|
        # "External" resources are ones that live outside the current
        # schema, i.e. k8s resources like ObjectMeta that other
        # k8s-compatible schemas depend on.
        #
        # Resources can be "empty" if they contain no properties. This
        # usually happens for resources that are really just aliases
        # for basic types like integer and string. The k8s' Duration
        # object is a good example. It's just an alias for string.
        yield res if !res.external? && !res.empty?
      end
    end

    private

    def load_resources
      @resources = []

      JSON.parse(File.read(start_path))['oneOf'].map do |entry|
        @resources << resource_from_ref(resolve_ref(entry['$ref']))
      end
    end

    def autoload_map
      @autoload_map ||= {}.tap do |amap|
        each_resource do |res|
          parts = res.ref.ruby_autoload_path.split(File::SEPARATOR)
          parts.reject!(&:empty?)

          [:root, *parts].inject(amap) do |ret, seg|
            if seg.end_with?('.rb')
              ret[seg] = res
            else
              ret[seg] ||= {}
            end
          end
        end
      end
    end

    def each_autoload_file_helper(amap, path, &block)
      amap.each do |ns, children|
        next unless children.is_a?(Hash)

        mod_name = [*path, ns]
          .flat_map { |seg| inflector.camelize(seg.gsub('-', '_')) }
          .join('::')

        ruby_code = "module #{mod_name}\n"

        children.each_pair do |child_ns, res|
          autoload_path = File.join(*path, ns, child_ns).chomp('.rb')

          if res.is_a?(Hash)
            ruby_code << "  autoload :#{inflector.camelize(child_ns)}, '#{autoload_path}'\n"
          else
            ruby_code << "  autoload :#{res.ref.kind}, '#{autoload_path}'\n"
          end
        end

        ruby_code << "end\n"
        yield File.join(output_dir, *path, "#{ns}.rb"), ruby_code
        each_autoload_file_helper(children, path + [ns], &block)
      end
    end

    def add_doc_to_resource(res, doc)
      if props = doc['properties']
        add_props_to_resource(props, res)
      end
    end

    def add_props_to_resource(properties, res)
      properties.each do |name, prop|
        next if name.start_with?('$')
        add_prop_to_resource(name, prop, res)
      end
    end

    def resolve_ref(ref_str)
      type = ref_str.split('/').last

      resolvers.each do |prefix, resolver|
        if type.start_with?(prefix)
          return resolver.call(ref_str, self)
        end
      end

      parse_ref(ref_str)
    end

    def add_prop_to_resource(name, prop, res)
      required = prop.include?('type') && !prop['type'].include?('null')

      case Array(prop['type']).first
        when 'array'
          if ref_str = prop.dig('items', '$ref')
            ref = resolve_ref(ref_str)
            res.fields[name] = ArrayFieldRes.new(
              name, required, resource_from_ref(ref)
            )
          elsif prop.dig('items', 'properties')
            child_ref = InlineRef.new(name, prop['items'], res.ref, serialize_handlers)
            child_res = resource_from_ref(child_ref)
            @resources << child_res
            res.fields[name] = ArrayFieldRes.new(name, required, child_res)
          else
            types = if result = prop.dig('items', 'type')
              Array(result)
            elsif result = prop.dig('items', 'types')
              Array(result)
            else
              ['string']
            end

            res.fields[name] = FieldRes.new(
              name, types.first, required
            )
          end

        when 'object'
          if prop.include?('properties')
            child_ref = InlineRef.new(name, prop, res.ref, serialize_handlers)
            child_res = resource_from_ref(child_ref)
            @resources << child_res
            res.fields[name] = ObjectFieldRes.new(name, child_res)
          else
            # no sub-properties this means key/value pairs
            type = prop.dig('additionalProperties', 'format') || 'string'
            res.fields[name] = KeyValueFieldRes.new(name, res, type, required)
          end

        when 'string', 'integer', 'number', 'boolean', 'date-time'
          enum = prop['enum']

          if enum&.size == 1
            res.fields[name] = DefaultFieldRes.new(name, res, enum)
          else
            res.fields[name] = FieldRes.new(
              name, Array(prop['type']).first, required
            )
          end

        else
          return unless prop.include?('$ref')

          ref = resolve_ref(prop['$ref'])

          if ref.object?
            # this ref refers to a nested type
            res.fields[name] = ObjectFieldRes.new(
              name, resource_from_ref(ref)
            )
          else
            # this ref refers to just a field
            res.fields[name] = FieldRes.new(
              name, (prop.dig('items', 'types') || ['string']).first, required
            )
          end
      end
    end

    def start_path
      @start_path ||= File.join(schema_dir, 'all.json')
    end

    def resource_cache
      @resource_cache ||= {}
    end
  end
end
