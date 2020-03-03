module KubeDSL::DSL::V1
  class GCEPersistentDiskVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :partition, :pd_name, :read_only

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:partition] = partition
        result[:pdName] = pd_name
        result[:readOnly] = read_only
      end
    end

    def kind
      :gce_persistent_disk_volume_source
    end
  end
end
