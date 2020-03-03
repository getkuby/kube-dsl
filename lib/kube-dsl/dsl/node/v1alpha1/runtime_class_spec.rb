module KubeDSL::DSL::Node::V1alpha1
  class RuntimeClassSpec < ::KubeDSL::DSLObject
    value_fields :runtime_handler
    object_field(:overhead) { KubeDSL::DSL::Node::V1alpha1::Overhead.new }
    object_field(:scheduling) { KubeDSL::DSL::Node::V1alpha1::Scheduling.new }

    def serialize
      {}.tap do |result|
        result[:runtimeHandler] = runtime_handler
        result[:overhead] = overhead.serialize
        result[:scheduling] = scheduling.serialize
      end
    end

    def kind
      :runtime_class_spec
    end
  end
end
