module KubeDSL::DSL::Flowcontrol::V1beta1
  class PriorityLevelConfiguration < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationSpec.new }
    object_field(:status) { KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1beta1"
        result[:kind] = "PriorityLevelConfiguration"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :priority_level_configuration
    end
  end
end
