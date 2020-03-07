module KubeDSL::DSL::Batch::V1
  class Job < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::V1::JobSpec.new }
    object_field(:status) { KubeDSL::DSL::Batch::V1::JobStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v1"
        result[:kind] = "Job"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :job
    end
  end
end
