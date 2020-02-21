module KubeDSL::DSL::Networking::V1
  class NetworkPolicyPeer
    extend ::KubeDSL::ValueFields

    object_field(:ip_block) { KubeDSL::DSL::Networking::V1::IPBlock.new }
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:pod_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :network_policy_peer
    end
  end
end
