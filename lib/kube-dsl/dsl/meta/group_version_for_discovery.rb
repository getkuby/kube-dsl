module KubeDSL::DSL::Meta
  class GroupVersionForDiscovery
    extend ::KubeDSL::ValueFields
    value_fields :group_version, :version

    def serialize
      {}.tap do |result|
        result[:groupVersion] = group_version
        result[:version] = version
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
