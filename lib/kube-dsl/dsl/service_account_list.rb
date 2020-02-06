module KubeDSL::DSL
  class ServiceAccountList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::ServiceAccount.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ServiceAccountList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
