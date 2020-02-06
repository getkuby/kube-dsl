module KubeDSL::DSL::Batch
  class CronJobSpec
    extend ::KubeDSL::ValueFields

    value_fields :concurrency_policy, :failed_jobs_history_limit, :schedule, :starting_deadline_seconds, :successful_jobs_history_limit, :suspend
    object_field(:job_template) { KubeDSL::DSL::Batch::JobTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:concurrencyPolicy] = concurrency_policy
        result[:failedJobsHistoryLimit] = failed_jobs_history_limit
        result[:schedule] = schedule
        result[:startingDeadlineSeconds] = starting_deadline_seconds
        result[:successfulJobsHistoryLimit] = successful_jobs_history_limit
        result[:suspend] = suspend
        result[:jobTemplate] = job_template.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cron_job_spec
    end
  end
end
