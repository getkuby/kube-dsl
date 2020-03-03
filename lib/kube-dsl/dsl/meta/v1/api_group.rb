module KubeDSL::DSL::Meta::V1
  class APIGroup < ::KubeDSL::DSLObject
    value_fields :name
    array_field(:server_address_by_client_cidr) { KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR.new }
    array_field(:version) { KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery.new }
    object_field(:preferred_version) { KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery.new }

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

    def kind
      :api_group
    end
  end
end
