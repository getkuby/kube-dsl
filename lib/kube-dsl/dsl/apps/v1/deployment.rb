# typed: true

module KubeDSL::DSL::Apps::V1
  class Deployment < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apps::V1::DeploymentSpec.new }
    object_field(:status) { KubeDSL::DSL::Apps::V1::DeploymentStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Apps::V1::DeploymentSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Apps::V1::DeploymentStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1"
        result[:kind] = "Deployment"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :deployment
    end
  end
end
