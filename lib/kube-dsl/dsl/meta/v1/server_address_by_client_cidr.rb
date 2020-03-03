module KubeDSL::DSL::Meta::V1
  class ServerAddressByClientCIDR < ::KubeDSL::DSLObject
    value_fields :client_cidr, :server_address

    def serialize
      {}.tap do |result|
        result[:clientCIDR] = client_cidr
        result[:serverAddress] = server_address
      end
    end

    def kind
      :server_address_by_client_cidr
    end
  end
end
