module KubeDSL::DSL::V1
  class PhotonPersistentDiskVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :pd_id

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:pdID] = pd_id
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :photon_persistent_disk_volume_source
    end
  end
end
