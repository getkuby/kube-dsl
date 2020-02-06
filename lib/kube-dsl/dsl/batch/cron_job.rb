module KubeDSL::DSL::Batch
  class CronJob
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::CronJobSpec.new }
    object_field(:status) { KubeDSL::DSL::Batch::CronJobStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v2alpha1"
        result[:kind] = "CronJob"
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
