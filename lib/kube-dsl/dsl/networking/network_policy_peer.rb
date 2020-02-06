module KubeDSL::DSL::Networking
  class NetworkPolicyPeer
    extend ::KubeDSL::ValueFields
    object_field(:ip_block) { KubeDSL::DSL::Networking::IPBlock.new }
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::LabelSelector.new }
    object_field(:pod_selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:ipBlock] = ip_block.serialize
        result[:namespaceSelector] = namespace_selector.serialize
        result[:podSelector] = pod_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
