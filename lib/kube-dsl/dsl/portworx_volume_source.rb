module KubeDSL::DSL
  class PortworxVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :read_only, :volume_id

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :portworx_volume_source
    end
  end
end
