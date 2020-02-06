module KubeDSL::DSL::Flowcontrol
  class PriorityLevelConfiguration
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Flowcontrol::PriorityLevelConfigurationSpec.new }
    object_field(:status) { KubeDSL::DSL::Flowcontrol::PriorityLevelConfigurationStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "PriorityLevelConfiguration"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_level_configuration
    end
  end
end
