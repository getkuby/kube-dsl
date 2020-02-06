module KubeDSL::DSL::Storage
  class VolumeAttachmentSource
    extend ::KubeDSL::ValueFields
    value_fields :persistent_volume_name
    object_field(:inline_volume_spec) { KubeDSL::DSL::PersistentVolumeSpec.new }

    def serialize
      {}.tap do |result|
        result[:persistentVolumeName] = persistent_volume_name
        result[:inlineVolumeSpec] = inline_volume_spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
