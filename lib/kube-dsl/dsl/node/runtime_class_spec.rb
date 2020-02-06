module KubeDSL::DSL::Node
  class RuntimeClassSpec
    extend ::KubeDSL::ValueFields

    value_fields :runtime_handler
    object_field(:overhead) { KubeDSL::DSL::Node::Overhead.new }
    object_field(:scheduling) { KubeDSL::DSL::Node::Scheduling.new }

    def serialize
      {}.tap do |result|
        result[:runtimeHandler] = runtime_handler
        result[:overhead] = overhead.serialize
        result[:scheduling] = scheduling.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :runtime_class_spec
    end
  end
end
