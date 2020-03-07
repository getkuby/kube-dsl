module KubeDSL::DSL::Storage::V1alpha1
  class VolumeAttachmentSource < ::KubeDSL::DSLObject
    value_fields :persistent_volume_name
    object_field(:inline_volume_spec) { KubeDSL::DSL::V1::PersistentVolumeSpec.new }

    def serialize
      {}.tap do |result|
        result[:persistentVolumeName] = persistent_volume_name
        result[:inlineVolumeSpec] = inline_volume_spec.serialize
      end
    end

    def kind_sym
      :volume_attachment_source
    end
  end
end
