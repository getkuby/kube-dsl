module KubeDSL::DSL
  class CinderVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :fs_type, :read_only, :volume_id
    object_field(:secret_ref) { KubeDSL::DSL::LocalObjectReference.new }

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
  end
end
