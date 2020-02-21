module KubeDSL::DSL::Meta::V1
  class GroupVersionForDiscovery
    extend ::KubeDSL::ValueFields

    value_fields :group_version, :version

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:groupVersion] = group_version
        result[:version] = version
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :group_version_for_discovery
    end
  end
end
