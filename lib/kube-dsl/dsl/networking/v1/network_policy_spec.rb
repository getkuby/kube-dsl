module KubeDSL::DSL::Networking::V1
  class NetworkPolicySpec
    extend ::KubeDSL::ValueFields

    array_field(:egress) { KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule.new }
    array_field(:ingress) { KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule.new }
    array_field :policy_type
    object_field(:pod_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :network_policy_spec
    end
  end
end
