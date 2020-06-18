module KubeDSL::DSL::V1
  class Secret < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    key_value_field(:data, format: :byte)
    key_value_field(:string_data, format: :string)

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Secret"
        result[:type] = type
        result[:metadata] = metadata.serialize
        result[:data] = data.serialize
        result[:stringData] = string_data.serialize
      end
    end

    def kind_sym
      :secret
    end
  end
end
