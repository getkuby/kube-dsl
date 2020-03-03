module KubeDSL::DSL::Batch::V1beta1
  class CronJobStatus < ::KubeDSL::DSLObject
    value_fields :last_schedule_time
    array_field(:active) { KubeDSL::DSL::V1::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:lastScheduleTime] = last_schedule_time
        result[:active] = actives.map(&:serialize)
      end
    end

    def kind
      :cron_job_status
    end
  end
end
