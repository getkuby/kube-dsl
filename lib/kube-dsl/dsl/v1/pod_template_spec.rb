module KubeDSL::DSL::V1
  class PodTemplateSpec < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::PodSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::V1::PodSpec }

    def serialize
      {}.tap do |result|
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :pod_template_spec
    end
  end
end
