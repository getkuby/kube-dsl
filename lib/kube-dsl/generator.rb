require 'json'

module KubeDSL
  class Generator
    attr_reader :dir

    def initialize(dir)
      @dir = dir
      @resources = {}
    end

    def resources
      load_doc(entrypoint_path)['oneOf'].map do |entry|
        resource_from_ref(Ref.new(entry['$ref']))
      end
    end

    def each_autoload_file(&block)
      each_autoload_file_helper(autoload_map['kube-dsl'], ['kube-dsl'], &block)
    end

    def each_autoload_file_helper(amap, path, &block)
      amap.each do |ns, children|
        return unless children.is_a?(Hash)

        mod_name = [*path, ns].map do |seg|
          case seg
            when 'dsl'
              'DSL'
            when 'kube-dsl'
              nil
            else
              KubeDSL::StringHelpers.capitalize(seg)
          end
        end.compact.join('::')

        ruby_code = "module #{mod_name}\n"

        children.each_pair do |child_ns, res|
          autoload_path = File.join(*path, ns, child_ns)

          if res.is_a?(Hash)
            ruby_code << "  autoload :#{KubeDSL::StringHelpers.capitalize(child_ns)}, '#{autoload_path}'\n"
          else
            ruby_code << "  autoload :#{res.ref.kind}, '#{autoload_path}'\n"
          end
        end

        ruby_code << "end\n"
        yield File.join(*path, "#{ns}.rb"), ruby_code
        each_autoload_file_helper(children, path + [ns], &block)
      end
    end

    def autoload_map
      @autoload_map ||= {}.tap do |amap|
        resources.each do |res|
          parts = res.ref.ruby_autoload_path.split(File::SEPARATOR)

          parts.inject(amap) do |ret, seg|
            if seg.end_with?('.rb')
              ret[seg] = res
            else
              ret[seg] ||= {}
            end
          end
        end
      end
    end

    def resource_from_ref(ref)
      if res = resource_cache[ref.str]
        return res
      end

      res = resource_cache[ref.str] = Resource.new(ref)

      add_doc_to_resource(
        res, load_doc(File.join(dir, ref.filename))
      )

      res
    end

    private

    def load_doc(filename)
      JSON.parse(File.read(filename))
    end

    def add_doc_to_resource(res, doc)
      if props = doc['properties']
        add_props_to_resource(props, res)
      end
    end

    def add_props_to_resource(properties, res)
      properties.each do |name, prop|
        add_prop_to_resource(name, prop, res)
      end
    end

    def add_prop_to_resource(name, prop, res)
      case (prop['type'] || []).first
        when 'array'
          if ref_str = prop['items']['$ref']
            ref = Ref.new(ref_str)
            res.array_fields[name] = resource_from_ref(ref)
          else
            res.array_fields[name] = nil
          end

        when 'object' # this means key/value pairs
          res.key_value_fields << name

        when 'string', 'integer', 'number', 'boolean'
          res.fields << name

        else
          ref = Ref.new(prop['$ref'])
          child = load_doc(File.join(dir, ref.filename))

          if child['properties']
            # this ref refers to a nested type
            res.object_fields[name] = resource_from_ref(
              Ref.new(prop['$ref'])
            )
          else
            # this ref refers to just a field
            res.fields << name
          end
      end
    end

    def entrypoint_path
      @entrypoint_path ||= File.join(dir, 'all.json')
    end

    def resource_cache
      @resource_cache ||= {}
    end
  end
end
