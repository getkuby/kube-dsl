module KubeDSL::DSL::Networking::V1
  class NetworkPolicyEgressRule < ::KubeDSL::DSLObject
    array_field(:port) { KubeDSL::DSL::Networking::V1::NetworkPolicyPort.new }
    array_field(:to) { KubeDSL::DSL::Networking::V1::NetworkPolicyPeer.new }

    def serialize
      {}.tap do |result|
        result[:ports] = ports.map(&:serialize)
        result[:to] = tos.map(&:serialize)
      end
    end

    def kind
      :network_policy_egress_rule
    end
  end
end
