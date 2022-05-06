# typed: true

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class VolumeAttachmentSpec < ::KubeDSL::DSLObject
          value_field :attacher
          value_field :node_name
          object_field(:source) { KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource.new }

          validates :attacher, field: { format: :string }, presence: false
          validates :node_name, field: { format: :string }, presence: false
          validates :source, object: { kind_of: KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource }

          def serialize
            {}.tap do |result|
              result[:attacher] = attacher
              result[:nodeName] = node_name
              result[:source] = source.serialize
            end
          end

          def kind_sym
            :volume_attachment_spec
          end
        end
      end
    end
  end
end