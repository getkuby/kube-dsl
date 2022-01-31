module KubeDSL::DSL::Batch::V1
  autoload :CronJob, 'kube-dsl/dsl/batch/v1/cron_job'
  autoload :CronJobList, 'kube-dsl/dsl/batch/v1/cron_job_list'
  autoload :CronJobSpec, 'kube-dsl/dsl/batch/v1/cron_job_spec'
  autoload :CronJobStatus, 'kube-dsl/dsl/batch/v1/cron_job_status'
  autoload :Job, 'kube-dsl/dsl/batch/v1/job'
  autoload :JobCondition, 'kube-dsl/dsl/batch/v1/job_condition'
  autoload :JobList, 'kube-dsl/dsl/batch/v1/job_list'
  autoload :JobSpec, 'kube-dsl/dsl/batch/v1/job_spec'
  autoload :JobStatus, 'kube-dsl/dsl/batch/v1/job_status'
  autoload :JobTemplateSpec, 'kube-dsl/dsl/batch/v1/job_template_spec'
  autoload :UncountedTerminatedPods, 'kube-dsl/dsl/batch/v1/uncounted_terminated_pods'
end
