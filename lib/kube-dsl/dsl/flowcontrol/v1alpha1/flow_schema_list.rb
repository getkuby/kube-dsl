module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchema.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchema }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "FlowSchemaList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :flow_schema_list
    end
  end
end
