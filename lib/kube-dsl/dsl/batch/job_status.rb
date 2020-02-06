module KubeDSL::DSL::Batch
  class JobStatus
    extend ::KubeDSL::ValueFields

    value_fields :active, :completion_time, :failed, :start_time, :succeeded
    array_field(:condition) { KubeDSL::DSL::Batch::JobCondition.new }

    def serialize
      {}.tap do |result|
        result[:active] = active
        result[:completionTime] = completion_time
        result[:failed] = failed
        result[:startTime] = start_time
        result[:succeeded] = succeeded
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :job_status
    end
  end
end
