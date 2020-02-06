module KubeDSL::DSL::Extensions
  class NetworkPolicySpec
    extend ::KubeDSL::ValueFields
    array_field(:egress) { KubeDSL::DSL::Extensions::NetworkPolicyEgressRule.new }
    array_field(:ingress) { KubeDSL::DSL::Extensions::NetworkPolicyIngressRule.new }
    array_field :policy_type
    object_field(:pod_selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:egress] = egresses.map(&:serialize)
        result[:ingress] = ingresses.map(&:serialize)
        result[:policyTypes] = policy_types
        result[:podSelector] = pod_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
