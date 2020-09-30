module KubeDSL::DSL::Batch::V2alpha1
  class CronJobSpec < ::KubeDSL::DSLObject
    value_field :concurrency_policy
    value_field :failed_jobs_history_limit
    object_field(:job_template) { KubeDSL::DSL::Batch::V2alpha1::JobTemplateSpec.new }
    value_field :schedule
    value_field :starting_deadline_seconds
    value_field :successful_jobs_history_limit
    value_field :suspend

    validates :concurrency_policy, field: { format: :string }, presence: false
    validates :failed_jobs_history_limit, field: { format: :integer }, presence: false
    validates :job_template, object: { kind_of: KubeDSL::DSL::Batch::V2alpha1::JobTemplateSpec }
    validates :schedule, field: { format: :string }, presence: false
    validates :starting_deadline_seconds, field: { format: :integer }, presence: false
    validates :successful_jobs_history_limit, field: { format: :integer }, presence: false
    validates :suspend, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:concurrencyPolicy] = concurrency_policy
        result[:failedJobsHistoryLimit] = failed_jobs_history_limit
        result[:jobTemplate] = job_template.serialize
        result[:schedule] = schedule
        result[:startingDeadlineSeconds] = starting_deadline_seconds
        result[:successfulJobsHistoryLimit] = successful_jobs_history_limit
        result[:suspend] = suspend
      end
    end

    def kind_sym
      :cron_job_spec
    end
  end
end
