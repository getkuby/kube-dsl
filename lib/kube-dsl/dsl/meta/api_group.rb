module KubeDSL::DSL::Meta
  class APIGroup
    extend ::KubeDSL::ValueFields

    value_fields :name
    array_field(:server_address_by_client_cidr) { KubeDSL::DSL::Meta::ServerAddressByClientCIDR.new }
    array_field(:version) { KubeDSL::DSL::Meta::GroupVersionForDiscovery.new }
    object_field(:preferred_version) { KubeDSL::DSL::Meta::GroupVersionForDiscovery.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIGroup"
        result[:name] = name
        result[:serverAddressByClientCIDRs] = server_address_by_client_cidrs.map(&:serialize)
        result[:versions] = versions.map(&:serialize)
        result[:preferredVersion] = preferred_version.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_group
    end
  end
end
