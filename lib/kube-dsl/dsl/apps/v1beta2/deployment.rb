module KubeDSL::DSL::Apps::V1beta2
  class Deployment < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apps::V1beta2::DeploymentSpec.new }
    object_field(:status) { KubeDSL::DSL::Apps::V1beta2::DeploymentStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
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
