module KubeDSL::DSL::V1
  class CinderPersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :read_only, :volume_id
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind
      :cinder_persistent_volume_source
    end
  end
end
