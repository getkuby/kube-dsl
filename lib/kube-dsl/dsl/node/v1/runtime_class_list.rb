# typed: true

module KubeDSL::DSL::Node::V1
  class RuntimeClassList < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::NodeSpec.new }
    object_field(:status) { KubeDSL::DSL::V1::NodeStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::V1::NodeSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::V1::NodeStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Node"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :runtime_class_list
    end
  end
end
