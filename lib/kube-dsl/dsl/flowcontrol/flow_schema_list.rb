module KubeDSL::DSL::Flowcontrol
  class FlowSchemaList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Flowcontrol::FlowSchema.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

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
  end
end
