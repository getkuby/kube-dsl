# typed: true
module KubeDSL
  class Resource
    attr_reader :contents

    def initialize(contents)
      @contents = contents
    end

    def serialize
      cleanup(contents)
    end

    def to_yaml
      YAML.dump(serialize)
    end

    def to_resource
      self
    end

    private

    def cleanup(obj)
      case obj
        when Array
          cleaned = obj.map { |child| cleanup(child) }.compact
          cleaned.empty? ? nil : cleaned
        when Hash
          cleaned = obj.each_with_object({}) do |(key, val), ret|
            if new_val = cleanup(val)
              ret[key.to_s] = new_val
            end
          end

          cleaned.empty? ? nil : cleaned
        else
          obj
      end
    end
  end
end
