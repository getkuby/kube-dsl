# typed: true

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class VolumeAttachmentSource < ::KubeDSL::DSLObject
          object_field(:inline_volume_spec) { KubeDSL::DSL::V1::PersistentVolumeSpec.new }
          value_field :persistent_volume_name

          validates :inline_volume_spec, object: { kind_of: KubeDSL::DSL::V1::PersistentVolumeSpec }
          validates :persistent_volume_name, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:inlineVolumeSpec] = inline_volume_spec.serialize
              result[:persistentVolumeName] = persistent_volume_name
            end
          end

          def kind_sym
            :volume_attachment_source
          end
        end
      end
    end
  end
end