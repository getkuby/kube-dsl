module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchema.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "FlowSchemaList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flow_schema_list
    end
  end
end
