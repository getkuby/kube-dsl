module KubeDSL::DSL::V1
  class CinderVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :read_only, :volume_id
    object_field(:secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind
      :cinder_volume_source
    end
  end
end
