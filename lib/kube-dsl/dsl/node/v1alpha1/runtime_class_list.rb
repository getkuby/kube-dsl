# typed: true

module KubeDSL::DSL::Node::V1alpha1
  class RuntimeClassList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Node::V1alpha1::RuntimeClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Node::V1alpha1::RuntimeClass }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "node.k8s.io/v1alpha1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "RuntimeClassList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :runtime_class_list
    end
  end
end
