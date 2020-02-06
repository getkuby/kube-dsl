module KubeDSL::DSL::Batch
  class Job
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::JobSpec.new }
    object_field(:status) { KubeDSL::DSL::Batch::JobStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v1"
        result[:kind] = "Job"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
