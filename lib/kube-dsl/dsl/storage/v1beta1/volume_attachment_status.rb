module KubeDSL::DSL::Storage::V1beta1
  class VolumeAttachmentStatus < ::KubeDSL::DSLObject
    value_fields :attached
    object_field(:attach_error) { KubeDSL::DSL::Storage::V1beta1::VolumeError.new }
    object_field(:detach_error) { KubeDSL::DSL::Storage::V1beta1::VolumeError.new }
    key_value_field(:attachment_metadata, format: :string)

    def serialize
      {}.tap do |result|
        result[:attached] = attached
        result[:attachError] = attach_error.serialize
        result[:detachError] = detach_error.serialize
        result[:attachmentMetadata] = attachment_metadata.serialize
      end
    end

    def kind_sym
      :volume_attachment_status
    end
  end
end
