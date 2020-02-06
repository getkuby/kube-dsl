module KubeDSL::DSL::Storage
  class VolumeAttachment
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Storage::VolumeAttachmentSpec.new }
    object_field(:status) { KubeDSL::DSL::Storage::VolumeAttachmentStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "VolumeAttachment"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_attachment
    end
  end
end
