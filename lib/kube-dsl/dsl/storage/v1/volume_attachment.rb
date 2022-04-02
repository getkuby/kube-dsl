# typed: true

module KubeDSL
  module DSL
    module Storage
      module V1
        class VolumeAttachment < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Storage::V1::VolumeAttachmentSpec.new }
          object_field(:status) { KubeDSL::DSL::Storage::V1::VolumeAttachmentStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Storage::V1::VolumeAttachmentSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Storage::V1::VolumeAttachmentStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "storage.k8s.io/v1"
              result[:kind] = "VolumeAttachment"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :volume_attachment
          end
        end
      end
    end
  end
end