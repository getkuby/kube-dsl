module KubeDSL::DSL::Batch::V1beta1
  class CronJobList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Batch::V1beta1::CronJob.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v1beta1"
        result[:kind] = "CronJobList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :cron_job_list
    end
  end
end
