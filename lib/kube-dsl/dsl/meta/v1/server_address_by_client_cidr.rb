# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class ServerAddressByClientCIDR < ::KubeDSL::DSLObject
          value_field :client_cidr
          value_field :server_address

          validates :client_cidr, field: { format: :string }, presence: false
          validates :server_address, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:clientCIDR] = client_cidr
              result[:serverAddress] = server_address
            end
          end

          def kind_sym
            :server_address_by_client_cidr
          end
        end
      end
    end
  end
end