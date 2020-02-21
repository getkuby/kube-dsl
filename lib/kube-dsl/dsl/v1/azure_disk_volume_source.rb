module KubeDSL::DSL::V1
  class AzureDiskVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :caching_mode, :disk_name, :disk_uri, :fs_type, :kind, :read_only

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:cachingMode] = caching_mode
        result[:diskName] = disk_name
        result[:diskURI] = disk_uri
        result[:fsType] = fs_type
        result[:kind] = kind
        result[:readOnly] = read_only
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :azure_disk_volume_source
    end
  end
end
