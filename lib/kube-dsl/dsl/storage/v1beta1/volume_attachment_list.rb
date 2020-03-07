module KubeDSL::DSL::Storage::V1beta1
  class VolumeAttachmentList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Storage::V1beta1::VolumeAttachment.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "VolumeAttachmentList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :volume_attachment_list
    end
  end
end
