module KubeDSL::DSL::V1
  class PhotonPersistentDiskVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :pd_id

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:pdID] = pd_id
      end
    end

    def kind_sym
      :photon_persistent_disk_volume_source
    end
  end
end
