# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicyPort < ::KubeDSL::DSLObject
          value_field :end_port
          value_field :port
          value_field :protocol

          validates :end_port, field: { format: :integer }, presence: false
          validates :port, field: { format: :string }, presence: false
          validates :protocol, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:endPort] = end_port
              result[:port] = port
              result[:protocol] = protocol
            end
          end

          def kind_sym
            :network_policy_port
          end
        end
      end
    end
  end
end