module KubeDSL::DSL::V1
  class VsphereVirtualDiskVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :storage_policy_id, :storage_policy_name, :volume_path

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:storagePolicyID] = storage_policy_id
        result[:storagePolicyName] = storage_policy_name
        result[:volumePath] = volume_path
      end
    end

    def kind_sym
      :vsphere_virtual_disk_volume_source
    end
  end
end
