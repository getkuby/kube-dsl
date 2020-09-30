module KubeDSL::DSL::Storage::V1
  class VolumeAttachmentList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Storage::V1::VolumeAttachment.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Storage::V1::VolumeAttachment }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "VolumeAttachmentList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :volume_attachment_list
    end
  end
end
