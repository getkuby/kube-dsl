module KubeDSL::DSL::Batch
  autoload :Job, 'kube-dsl/dsl/batch/job'
  autoload :JobCondition, 'kube-dsl/dsl/batch/job_condition'
  autoload :JobList, 'kube-dsl/dsl/batch/job_list'
  autoload :JobSpec, 'kube-dsl/dsl/batch/job_spec'
  autoload :JobStatus, 'kube-dsl/dsl/batch/job_status'
  autoload :CronJob, 'kube-dsl/dsl/batch/cron_job'
  autoload :CronJobList, 'kube-dsl/dsl/batch/cron_job_list'
  autoload :CronJobSpec, 'kube-dsl/dsl/batch/cron_job_spec'
  autoload :CronJobStatus, 'kube-dsl/dsl/batch/cron_job_status'
  autoload :JobTemplateSpec, 'kube-dsl/dsl/batch/job_template_spec'
end
