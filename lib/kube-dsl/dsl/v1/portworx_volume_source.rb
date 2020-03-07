module KubeDSL::DSL::V1
  class PortworxVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :read_only, :volume_id

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:volumeID] = volume_id
      end
    end

    def kind_sym
      :portworx_volume_source
    end
  end
end
