module KubeDSL::DSL::V1
  class PodTemplate < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PodTemplate"
        result[:metadata] = metadata.serialize
        result[:template] = template.serialize
      end
    end

    def kind
      :pod_template
    end
  end
end
