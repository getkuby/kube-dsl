module KubeDSL::DSL::Meta::V1
  class APIVersions < ::KubeDSL::DSLObject
    value_fields :versions
    array_field(:server_address_by_client_cidr) { KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIVersions"
        result[:versions] = versions
        result[:serverAddressByClientCIDRs] = server_address_by_client_cidrs.map(&:serialize)
      end
    end

    def kind_sym
      :api_versions
    end
  end
end
