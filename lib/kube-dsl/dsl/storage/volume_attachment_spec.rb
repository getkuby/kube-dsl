module KubeDSL::DSL::Storage
  class VolumeAttachmentSpec
    extend ::KubeDSL::ValueFields
    value_fields :attacher, :node_name
    object_field(:source) { KubeDSL::DSL::Storage::VolumeAttachmentSource.new }

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
  end
end
