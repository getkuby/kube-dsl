# typed: true

module KubeDSL::DSL::V1
  class ResourceQuota < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::ResourceQuotaSpec.new }
    object_field(:status) { KubeDSL::DSL::V1::ResourceQuotaStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::V1::ResourceQuotaSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::V1::ResourceQuotaStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ResourceQuota"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :resource_quota
    end
  end
end
