require 'base64'

module KubeDSL
  class KeyValueFields
    attr_reader :format

    def initialize(format: :string)
      @format = format
      @kv_pairs = {}
    end

    def add(key, value)
      @kv_pairs[key] = value
    end

    def remove(key)
      @kv_pairs.delete(key)
    end

    def get(key)
      @kv_pairs[key]
    end

    def set(key, value)
      @kv_pairs[key] = value
    end

    def serialize
      @kv_pairs.each_with_object({}) do |(key, value), ret|
        ret[key] = serialize_value(value)
      end
    end

    private

    def serialize_value(data)
      case format
        when :byte
          Base64.strict_encode64(data.to_s)
        else
          data
      end
    end
  end
end
