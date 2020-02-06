module KubeDSL::DSL
  class Secret
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :secret
    end
  end
end
