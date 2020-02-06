module KubeDSL::DSL::Meta
  class ServerAddressByClientCIDR
    extend ::KubeDSL::ValueFields
    value_fields :client_cidr, :server_address

    def serialize
      {}.tap do |result|
        result[:clientCIDR] = client_cidr
        result[:serverAddress] = server_address
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
