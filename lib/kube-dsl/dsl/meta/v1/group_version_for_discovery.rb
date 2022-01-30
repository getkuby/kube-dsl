# typed: true

module KubeDSL::DSL::Meta::V1
  class GroupVersionForDiscovery < ::KubeDSL::DSLObject
    value_field :group_version
    value_field :version

    validates :group_version, field: { format: :string }, presence: false
    validates :version, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:groupVersion] = group_version
        result[:version] = version
      end
    end

    def kind_sym
      :group_version_for_discovery
    end
  end
end
