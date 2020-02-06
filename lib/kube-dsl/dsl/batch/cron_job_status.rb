module KubeDSL::DSL::Batch
  class CronJobStatus
    extend ::KubeDSL::ValueFields
    value_fields :last_schedule_time
    array_field(:active) { KubeDSL::DSL::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:lastScheduleTime] = last_schedule_time
        result[:active] = actives.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
