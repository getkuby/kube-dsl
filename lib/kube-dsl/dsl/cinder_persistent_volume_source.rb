module KubeDSL::DSL
  class CinderPersistentVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :read_only, :volume_id
    object_field(:secret_ref) { KubeDSL::DSL::SecretReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
        result[:secretRef] = secret_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cinder_persistent_volume_source
    end
  end
end
