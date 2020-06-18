module KubeDSL::DSL::V1
  class ConfigMap < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    key_value_field(:binary_data, format: :byte)
    key_value_field(:data, format: :string)

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ConfigMap"
        result[:metadata] = metadata.serialize
        result[:binaryData] = binary_data.serialize
        result[:data] = data.serialize
      end
    end

    def kind_sym
      :config_map
    end
  end
end
