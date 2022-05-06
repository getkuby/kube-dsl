# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicyPeer < ::KubeDSL::DSLObject
          object_field(:ip_block) { KubeDSL::DSL::Networking::V1::IPBlock.new }
          object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          object_field(:pod_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

          validates :ip_block, object: { kind_of: KubeDSL::DSL::Networking::V1::IPBlock }
          validates :namespace_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :pod_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }

          def serialize
            {}.tap do |result|
              result[:ipBlock] = ip_block.serialize
              result[:namespaceSelector] = namespace_selector.serialize
              result[:podSelector] = pod_selector.serialize
            end
          end

          def kind_sym
            :network_policy_peer
          end
        end
      end
    end
  end
end