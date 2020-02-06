module KubeDSL::DSL
  class SecretList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Secret.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "SecretList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :secret_list
    end
  end
end
