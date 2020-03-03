module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfiguration < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfigurationSpec.new }
    object_field(:status) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfigurationStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "PriorityLevelConfiguration"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :priority_level_configuration
    end
  end
end
