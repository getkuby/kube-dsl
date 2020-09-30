module KubeDSL::DSL::V1
  class VsphereVirtualDiskVolumeSource < ::KubeDSL::DSLObject
    value_field :fs_type
    value_field :storage_policy_id
    value_field :storage_policy_name
    value_field :volume_path

    validates :fs_type, field: { format: :string }, presence: false
    validates :storage_policy_id, field: { format: :string }, presence: false
    validates :storage_policy_name, field: { format: :string }, presence: false
    validates :volume_path, field: { format: :string }, presence: false

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
