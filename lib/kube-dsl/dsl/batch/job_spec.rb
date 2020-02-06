module KubeDSL::DSL::Batch
  class JobSpec
    extend ::KubeDSL::ValueFields

    value_fields :active_deadline_seconds, :backoff_limit, :completions, :manual_selector, :parallelism, :ttl_seconds_after_finished
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :job_spec
    end
  end
end
