# typed: true

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicyIngressRule < ::KubeDSL::DSLObject
          array_field(:from) { KubeDSL::DSL::Networking::V1::NetworkPolicyPeer.new }
          array_field(:port) { KubeDSL::DSL::Networking::V1::NetworkPolicyPort.new }

          validates :froms, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicyPeer }, presence: false
          validates :ports, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicyPort }, presence: false

          def serialize
            {}.tap do |result|
              result[:from] = froms.map(&:serialize)
              result[:ports] = ports.map(&:serialize)
            end
          end

          def kind_sym
            :network_policy_ingress_rule
          end
        end
      end
    end
  end
end