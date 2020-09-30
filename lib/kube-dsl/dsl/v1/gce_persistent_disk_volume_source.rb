module KubeDSL::DSL::V1
  class GCEPersistentDiskVolumeSource < ::KubeDSL::DSLObject
    value_field :fs_type
    value_field :partition
    value_field :pd_name
    value_field :read_only

    validates :fs_type, field: { format: :string }, presence: false
    validates :partition, field: { format: :integer }, presence: false
    validates :pd_name, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:partition] = partition
        result[:pdName] = pd_name
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :gce_persistent_disk_volume_source
    end
  end
end
