# typed: true

module KubeDSL::DSL::V1
  class PhotonPersistentDiskVolumeSource < ::KubeDSL::DSLObject
    value_field :fs_type
    value_field :pd_id

    validates :fs_type, field: { format: :string }, presence: false
    validates :pd_id, field: { format: :string }, presence: false

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
