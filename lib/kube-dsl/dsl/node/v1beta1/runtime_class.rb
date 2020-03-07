module KubeDSL::DSL::Node::V1beta1
  class RuntimeClass < ::KubeDSL::DSLObject
    value_fields :handler
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:overhead) { KubeDSL::DSL::Node::V1beta1::Overhead.new }
    object_field(:scheduling) { KubeDSL::DSL::Node::V1beta1::Scheduling.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "node.k8s.io/v1beta1"
        result[:kind] = "RuntimeClass"
        result[:handler] = handler
        result[:metadata] = metadata.serialize
        result[:overhead] = overhead.serialize
        result[:scheduling] = scheduling.serialize
      end
    end

    def kind_sym
      :runtime_class
    end
  end
end
