module KubeDSL::DSL::V1
  class VsphereVirtualDiskVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :storage_policy_id, :storage_policy_name, :volume_path

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:storagePolicyID] = storage_policy_id
        result[:storagePolicyName] = storage_policy_name
        result[:volumePath] = volume_path
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :vsphere_virtual_disk_volume_source
    end
  end
end
