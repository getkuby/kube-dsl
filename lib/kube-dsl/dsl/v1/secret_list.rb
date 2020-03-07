module KubeDSL::DSL::V1
  class SecretList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Secret.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "SecretList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :secret_list
    end
  end
end
