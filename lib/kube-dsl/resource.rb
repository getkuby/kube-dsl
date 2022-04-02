# typed: strict

module KubeDSL
  class Resource
    extend T::Sig

    sig { returns(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])) }
    attr_reader :contents

    sig { params(contents: T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])).void }
    def initialize(contents)
      @contents = contents
    end

    sig { returns(T.nilable(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped]))) }
    def serialize
      cleanup(contents)
    end

    sig { returns(String) }
    def to_yaml
      YAML.dump(serialize)
    end

    sig { returns(Resource) }
    def to_resource
      self
    end

    private

    sig {
      params(obj: T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped]))
        .returns(T.nilable(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])))
    }
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
