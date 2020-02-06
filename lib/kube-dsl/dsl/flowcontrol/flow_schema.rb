module KubeDSL::DSL::Flowcontrol
  class FlowSchema
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Flowcontrol::FlowSchemaSpec.new }
    object_field(:status) { KubeDSL::DSL::Flowcontrol::FlowSchemaStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "FlowSchema"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flow_schema
    end
  end
end
