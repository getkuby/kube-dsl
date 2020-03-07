module KubeDSL::DSL::Batch::V1beta1
  class CronJobSpec < ::KubeDSL::DSLObject
    value_fields :concurrency_policy, :failed_jobs_history_limit, :schedule, :starting_deadline_seconds, :successful_jobs_history_limit, :suspend
    object_field(:job_template) { KubeDSL::DSL::Batch::V1beta1::JobTemplateSpec.new }

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

    def kind_sym
      :cron_job_spec
    end
  end
end
