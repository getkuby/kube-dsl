module KubeDSL::DSL::Storage::V1beta1
  class CSIDriverSpec < ::KubeDSL::DSLObject
    value_field :attach_required
    value_field :pod_info_on_mount
    value_field :volume_lifecycle_modes

    validates :attach_required, field: { format: :boolean }, presence: false
    validates :pod_info_on_mount, field: { format: :boolean }, presence: false
    validates :volume_lifecycle_modes, field: { format: :string }, presence: false

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
