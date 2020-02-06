module KubeDSL::DSL::Networking
  class NetworkPolicySpec
    extend ::KubeDSL::ValueFields
    array_field(:egress) { KubeDSL::DSL::Networking::NetworkPolicyEgressRule.new }
    array_field(:ingress) { KubeDSL::DSL::Networking::NetworkPolicyIngressRule.new }
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
