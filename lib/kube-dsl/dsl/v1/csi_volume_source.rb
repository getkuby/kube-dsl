module KubeDSL::DSL::V1
  class CSIVolumeSource < ::KubeDSL::DSLObject
    value_fields :driver, :fs_type, :read_only
    object_field(:node_publish_secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }
    object_field(:volume_attributes) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:driver] = driver
        result[:fsType] = fs_type
        result[:readOnly] = read_only
        result[:nodePublishSecretRef] = node_publish_secret_ref.serialize
        result[:volumeAttributes] = volume_attributes.serialize
      end
    end

    def kind_sym
      :csi_volume_source
    end
  end
end
