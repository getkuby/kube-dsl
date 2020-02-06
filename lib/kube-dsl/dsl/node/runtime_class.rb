module KubeDSL::DSL::Node
  class RuntimeClass
    extend ::KubeDSL::ValueFields

    value_fields :handler
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:overhead) { KubeDSL::DSL::Node::Overhead.new }
    object_field(:scheduling) { KubeDSL::DSL::Node::Scheduling.new }

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :runtime_class
    end
  end
end
