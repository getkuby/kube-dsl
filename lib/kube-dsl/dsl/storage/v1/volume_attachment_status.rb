# typed: true

module KubeDSL::DSL::Storage::V1
  class VolumeAttachmentStatus < ::KubeDSL::DSLObject
    object_field(:attach_error) { KubeDSL::DSL::Storage::V1::VolumeError.new }
    value_field :attached
    key_value_field(:attachment_metadata, format: :string)
    object_field(:detach_error) { KubeDSL::DSL::Storage::V1::VolumeError.new }

    validates :attach_error, object: { kind_of: KubeDSL::DSL::Storage::V1::VolumeError }
    validates :attached, field: { format: :boolean }, presence: false
    validates :attachment_metadata, kv: { value_format: :string }, presence: false
    validates :detach_error, object: { kind_of: KubeDSL::DSL::Storage::V1::VolumeError }

    def serialize
      {}.tap do |result|
        result[:attachError] = attach_error.serialize
        result[:attached] = attached
        result[:attachmentMetadata] = attachment_metadata.serialize
        result[:detachError] = detach_error.serialize
      end
    end

    def kind_sym
      :volume_attachment_status
    end
  end
end
