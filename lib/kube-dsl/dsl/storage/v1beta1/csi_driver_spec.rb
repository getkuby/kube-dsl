module KubeDSL::DSL::Storage::V1beta1
  class CSIDriverSpec < ::KubeDSL::DSLObject
    value_fields :attach_required, :pod_info_on_mount, :volume_lifecycle_modes

    def serialize
      {}.tap do |result|
        result[:attachRequired] = attach_required
        result[:podInfoOnMount] = pod_info_on_mount
        result[:volumeLifecycleModes] = volume_lifecycle_modes
      end
    end

    def kind_sym
      :csi_driver_spec
    end
  end
end
