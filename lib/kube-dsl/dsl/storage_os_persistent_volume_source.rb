module KubeDSL::DSL
  class StorageOSPersistentVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :fs_type, :read_only, :volume_name, :volume_namespace
    object_field(:secret_ref) { KubeDSL::DSL::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeName] = volume_name
        result[:volumeNamespace] = volume_namespace
        result[:secretRef] = secret_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
