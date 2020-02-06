module KubeDSL::DSL::Extensions
  class NetworkPolicyEgressRule
    extend ::KubeDSL::ValueFields

    array_field(:port) { KubeDSL::DSL::Extensions::NetworkPolicyPort.new }
    array_field(:to) { KubeDSL::DSL::Extensions::NetworkPolicyPeer.new }

    def serialize
      {}.tap do |result|
        result[:ports] = ports.map(&:serialize)
        result[:to] = tos.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :network_policy_egress_rule
    end
  end
end
