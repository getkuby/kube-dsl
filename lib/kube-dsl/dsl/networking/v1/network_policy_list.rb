# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicyList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Networking::V1::NetworkPolicy.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Networking::V1::NetworkPolicy }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "networking.k8s.io/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "NetworkPolicyList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :network_policy_list
          end
        end
      end
    end
  end
end