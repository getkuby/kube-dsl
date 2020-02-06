module KubeDSL::DSL::Node
  class RuntimeClassList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Node::RuntimeClass.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "node.k8s.io/v1beta1"
        result[:kind] = "RuntimeClassList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
