require 'base64'

module KubeDSL
  class KeyValueFields
    attr_reader :format

    def initialize(format: :string)
      @format = format
    end

    def method_missing(method_name, *args)
      kv_class.value_fields(method_name)
      kv_fields << method_name
      kv_instance.send(method_name, *args)
    end

    def serialize
      kv_fields.each_with_object({}) do |field, ret|
        ret[field] = serialize_field(kv_instance.send(field))
      end
    end

    private

    def serialize_field(data)
      case format
        when :byte
          Base64.strict_encode64(data.to_s)
        else
          data
      end
    end

    def kv_fields
      @kv_fields ||= []
    end

    def kv_class
      @kv_class ||= Class.new do
        extend ValueFields
      end
    end

    def kv_instance
      @kv_instance ||= kv_class.new
    end
  end
end
