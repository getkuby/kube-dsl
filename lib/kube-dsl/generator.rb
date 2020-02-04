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
