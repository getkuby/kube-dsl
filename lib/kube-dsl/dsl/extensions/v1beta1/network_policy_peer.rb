module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyPeer < ::KubeDSL::DSLObject
    object_field(:ip_block) { KubeDSL::DSL::Extensions::V1beta1::IPBlock.new }
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:pod_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:ipBlock] = ip_block.serialize
        result[:namespaceSelector] = namespace_selector.serialize
        result[:podSelector] = pod_selector.serialize
      end
    end

    def kind
      :network_policy_peer
    end
  end
end
