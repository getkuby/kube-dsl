module KubeDSL::DSL::V1
  class ConfigMap < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:binary_data) { ::KubeDSL::KeyValueFields.new(format: :byte) }
    object_field(:data) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ConfigMap"
        result[:metadata] = metadata.serialize
        result[:binaryData] = binary_data.serialize
        result[:data] = data.serialize
      end
    end

    def kind
      :config_map
    end
  end
end
