# typed: strict

module KubeDSL
  module DSL
    module V1
      class CSIPersistentVolumeSource < ::KubeDSL::DSLObject
        object_field(:controller_expand_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        object_field(:controller_publish_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        value_field :driver
        value_field :fs_type
        object_field(:node_publish_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        object_field(:node_stage_secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
        value_field :read_only
        key_value_field(:volume_attributes, format: :string)
        value_field :volume_handle

        validates :controller_expand_secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :controller_publish_secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :driver, field: { format: :string }, presence: false
        validates :fs_type, field: { format: :string }, presence: false
        validates :node_publish_secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :node_stage_secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
        validates :read_only, field: { format: :boolean }, presence: false
        validates :volume_attributes, kv: { value_format: :string }, presence: false
        validates :volume_handle, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:controllerExpandSecretRef] = controller_expand_secret_ref.serialize
            result[:controllerPublishSecretRef] = controller_publish_secret_ref.serialize
            result[:driver] = driver
            result[:fsType] = fs_type
            result[:nodePublishSecretRef] = node_publish_secret_ref.serialize
            result[:nodeStageSecretRef] = node_stage_secret_ref.serialize
            result[:readOnly] = read_only
            result[:volumeAttributes] = volume_attributes.serialize
            result[:volumeHandle] = volume_handle
          end
        end

        def kind_sym
          :csi_persistent_volume_source
        end
      end
    end
  end
end