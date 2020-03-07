module KubeDSL::DSL::Batch::V2alpha1
  class CronJob < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::V2alpha1::CronJobSpec.new }
    object_field(:status) { KubeDSL::DSL::Batch::V2alpha1::CronJobStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v2alpha1"
        result[:kind] = "CronJob"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :cron_job
    end
  end
end
