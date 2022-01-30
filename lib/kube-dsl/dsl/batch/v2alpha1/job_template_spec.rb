# typed: true

module KubeDSL::DSL::Batch::V2alpha1
  class JobTemplateSpec < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::V1::JobSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Batch::V1::JobSpec }

    def serialize
      {}.tap do |result|
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :job_template_spec
    end
  end
end
