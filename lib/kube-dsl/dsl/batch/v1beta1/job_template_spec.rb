module KubeDSL::DSL::Batch::V1beta1
  class JobTemplateSpec < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::V1::JobSpec.new }

    def serialize
      {}.tap do |result|
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind
      :job_template_spec
    end
  end
end
