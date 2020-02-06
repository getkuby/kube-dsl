module KubeDSL::DSL::Meta
  class APIVersions
    extend ::KubeDSL::ValueFields
    array_field(:server_address_by_client_cidr) { KubeDSL::DSL::Meta::ServerAddressByClientCIDR.new }
    array_field :version

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIVersions"
        result[:serverAddressByClientCIDRs] = server_address_by_client_cidrs.map(&:serialize)
        result[:versions] = versions
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
