module KubeDSL::DSL::V1
  class AzureDiskVolumeSource < ::KubeDSL::DSLObject
    value_fields :caching_mode, :disk_name, :disk_uri, :fs_type, :kind, :read_only

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

    def kind
      :azure_disk_volume_source
    end
  end
end
