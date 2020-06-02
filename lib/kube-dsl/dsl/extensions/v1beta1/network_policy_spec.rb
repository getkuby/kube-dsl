module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicySpec < ::KubeDSL::DSLObject
    value_fields :policy_types
    array_field(:egress) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyEgressRule.new }
    array_field(:ingress) { KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyIngressRule.new }
    object_field(:pod_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:policyTypes] = policy_types
        result[:egress] = egresses.map(&:serialize)
        result[:ingress] = ingresses.map(&:serialize)
        result[:podSelector] = pod_selector.serialize
      end
    end

    def kind_sym
      :network_policy_spec
    end
  end
end
