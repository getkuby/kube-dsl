module KubeDSL::DSL
  class PodTemplate
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PodTemplate"
        result[:metadata] = metadata.serialize
        result[:template] = template.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
