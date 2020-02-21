module KubeDSL::DSL::Batch::V2alpha1
  class CronJobStatus
    extend ::KubeDSL::ValueFields

    value_fields :last_schedule_time
    array_field(:active) { KubeDSL::DSL::V1::ObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:lastScheduleTime] = last_schedule_time
        result[:active] = actives.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cron_job_status
    end
  end
end
