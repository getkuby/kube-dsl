module KubeDSL::DSL::V1
  class StorageOSPersistentVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :read_only, :volume_name, :volume_namespace
    object_field(:secret_ref) { KubeDSL::DSL::V1::ObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :storage_os_persistent_volume_source
    end
  end
end
