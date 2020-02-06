module KubeDSL::DSL
  class ResourceQuotaList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::ResourceQuota.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ResourceQuotaList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_quota_list
    end
  end
end
