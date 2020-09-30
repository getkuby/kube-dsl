module KubeDSL::DSL::Meta::V1
  class APIGroup < ::KubeDSL::DSLObject
    value_field :name
    object_field(:preferred_version) { KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery.new }
    array_field(:server_address_by_client_cidr) { KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR.new }
    array_field(:version) { KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery.new }

    validates :name, field: { format: :string }, presence: false
    validates :preferred_version, object: { kind_of: KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery }
    validates :server_address_by_client_cidrs, array: { kind_of: KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR }, presence: false
    validates :versions, array: { kind_of: KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "APIGroup"
        result[:name] = name
        result[:preferredVersion] = preferred_version.serialize
        result[:serverAddressByClientCIDRs] = server_address_by_client_cidrs.map(&:serialize)
        result[:versions] = versions.map(&:serialize)
      end
    end

    def kind_sym
      :api_group
    end
  end
end
