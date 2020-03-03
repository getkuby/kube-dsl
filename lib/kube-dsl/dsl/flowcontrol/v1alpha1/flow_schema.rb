module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchema < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchemaSpec.new }
    object_field(:status) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchemaStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "FlowSchema"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :flow_schema
    end
  end
end
