module KubeDSL::DSL::Storage::V1alpha1
  class VolumeAttachmentSpec
    extend ::KubeDSL::ValueFields

    value_fields :attacher, :node_name
    object_field(:source) { KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:attacher] = attacher
        result[:nodeName] = node_name
        result[:source] = source.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_attachment_spec
    end
  end
end
