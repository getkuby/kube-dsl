module KubeDSL::DSL::V1
  class ResourceQuotaList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::V1::ResourceQuota.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
