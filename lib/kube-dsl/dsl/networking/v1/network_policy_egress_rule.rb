# typed: true

module KubeDSL::DSL::Networking::V1
  class NetworkPolicyEgressRule < ::KubeDSL::DSLObject
    array_field(:port) { KubeDSL::DSL::Networking::V1::NetworkPolicyPort.new }
    array_field(:to) { KubeDSL::DSL::Networking::V1::NetworkPolicyPeer.new }

    validates :ports, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicyPort }, presence: false
    validates :tos, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicyPeer }, presence: false

    def serialize
      {}.tap do |result|
        result[:ports] = ports.map(&:serialize)
        result[:to] = tos.map(&:serialize)
      end
    end

    def kind_sym
      :network_policy_egress_rule
    end
  end
end
