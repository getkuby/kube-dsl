module KubeDSL::DSL::Batch::V1
  class JobSpec < ::KubeDSL::DSLObject
    value_fields :active_deadline_seconds, :backoff_limit, :completions, :manual_selector, :parallelism, :ttl_seconds_after_finished
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:activeDeadlineSeconds] = active_deadline_seconds
        result[:backoffLimit] = backoff_limit
        result[:completions] = completions
        result[:manualSelector] = manual_selector
        result[:parallelism] = parallelism
        result[:ttlSecondsAfterFinished] = ttl_seconds_after_finished
        result[:selector] = selector.serialize
        result[:template] = template.serialize
      end
    end

    def kind
      :job_spec
    end
  end
end
