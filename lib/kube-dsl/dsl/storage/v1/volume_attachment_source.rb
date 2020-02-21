module KubeDSL::DSL::Storage::V1
  class VolumeAttachmentSource
    extend ::KubeDSL::ValueFields

    value_fields :persistent_volume_name
    object_field(:inline_volume_spec) { KubeDSL::DSL::V1::PersistentVolumeSpec.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:persistentVolumeName] = persistent_volume_name
        result[:inlineVolumeSpec] = inline_volume_spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_attachment_source
    end
  end
end
