module KubeDSL::DSL::Meta::V1
  class GroupVersionForDiscovery < ::KubeDSL::DSLObject
    value_fields :group_version, :version

    def serialize
      {}.tap do |result|
        result[:groupVersion] = group_version
        result[:version] = version
      end
    end

    def kind
      :group_version_for_discovery
    end
  end
end
