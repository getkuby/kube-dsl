# typed: strict

module KubeDSL
  module DSL
    module V1
      class CSIVolumeSource < ::KubeDSL::DSLObject
        value_field :driver
        value_field :fs_type
        object_field(:node_publish_secret_ref) { KubeDSL::DSL::V1::LocalObjectReference.new }
        value_field :read_only
        key_value_field(:volume_attributes, format: :string)

        validates :driver, field: { format: :string }, presence: false
        validates :fs_type, field: { format: :string }, presence: false
        validates :node_publish_secret_ref, object: { kind_of: KubeDSL::DSL::V1::LocalObjectReference }
        validates :read_only, field: { format: :boolean }, presence: false
        validates :volume_attributes, kv: { value_format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:driver] = driver
            result[:fsType] = fs_type
            result[:nodePublishSecretRef] = node_publish_secret_ref.serialize
            result[:readOnly] = read_only
            result[:volumeAttributes] = volume_attributes.serialize
          end
        end

        def kind_sym
          :csi_volume_source
        end
      end
    end
  end
end