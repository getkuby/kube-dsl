# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicySpec < ::KubeDSL::DSLObject
          array_field(:egress) { KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule.new }
          array_field(:ingress) { KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule.new }
          object_field(:pod_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          value_field :policy_types

          validates :egresses, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule }, presence: false
          validates :ingresses, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule }, presence: false
          validates :pod_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :policy_types, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:egress] = egresses.map(&:serialize)
              result[:ingress] = ingresses.map(&:serialize)
              result[:podSelector] = pod_selector.serialize
              result[:policyTypes] = policy_types
            end
          end

          def kind_sym
            :network_policy_spec
          end
        end
      end
    end
  end
end