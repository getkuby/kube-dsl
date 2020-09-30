module KubeDSL::DSL::Meta::V1
  class APIVersions < ::KubeDSL::DSLObject
    array_field(:server_address_by_client_cidr) { KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR.new }
    value_field :versions

    validates :server_address_by_client_cidrs, array: { kind_of: KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR }, presence: false
    validates :versions, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIVersions"
        result[:serverAddressByClientCIDRs] = server_address_by_client_cidrs.map(&:serialize)
        result[:versions] = versions
      end
    end

    def kind_sym
      :api_versions
    end
  end
end
