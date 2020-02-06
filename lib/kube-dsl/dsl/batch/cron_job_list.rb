module KubeDSL::DSL::Batch
  class CronJobList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Batch::CronJob.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v2alpha1"
        result[:kind] = "CronJobList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cron_job_list
    end
  end
end
