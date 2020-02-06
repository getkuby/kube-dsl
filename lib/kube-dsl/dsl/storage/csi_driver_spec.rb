module KubeDSL::DSL::Storage
  class CSIDriverSpec
    extend ::KubeDSL::ValueFields
    value_fields :attach_required, :pod_info_on_mount
    array_field :volume_lifecycle_mode

    def serialize
      {}.tap do |result|
        result[:attachRequired] = attach_required
        result[:podInfoOnMount] = pod_info_on_mount
        result[:volumeLifecycleModes] = volume_lifecycle_modes
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
