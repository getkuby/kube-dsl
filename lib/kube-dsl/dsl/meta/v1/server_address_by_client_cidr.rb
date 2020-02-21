module KubeDSL::DSL::Meta::V1
  class ServerAddressByClientCIDR
    extend ::KubeDSL::ValueFields

    value_fields :client_cidr, :server_address

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:clientCIDR] = client_cidr
        result[:serverAddress] = server_address
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :server_address_by_client_cidr
    end
  end
end
