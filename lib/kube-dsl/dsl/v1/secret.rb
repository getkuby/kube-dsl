module KubeDSL::DSL::V1
  class Secret < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:data) { ::KubeDSL::KeyValueFields.new(format: :byte) }
    object_field(:string_data) { ::KubeDSL::KeyValueFields.new(format: :string) }

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

    def kind
      :secret
    end
  end
end
