module KubeDSL::DSL::Node::V1alpha1
  class RuntimeClass < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Node::V1alpha1::RuntimeClassSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "node.k8s.io/v1alpha1"
        result[:kind] = "RuntimeClass"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :runtime_class
    end
  end
end
