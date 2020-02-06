module KubeDSL::DSL::Storage
  class VolumeAttachmentStatus
    extend ::KubeDSL::ValueFields

    value_fields :attached
    object_field(:attach_error) { KubeDSL::DSL::Storage::VolumeError.new }
    object_field(:detach_error) { KubeDSL::DSL::Storage::VolumeError.new }
    object_field(:attachment_metadata) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:attached] = attached
        result[:attachError] = attach_error.serialize
        result[:detachError] = detach_error.serialize
        result[:attachmentMetadata] = attachment_metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_attachment_status
    end
  end
end
