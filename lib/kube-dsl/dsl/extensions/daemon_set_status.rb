module KubeDSL::DSL::Extensions
  class DaemonSetStatus
    extend ::KubeDSL::ValueFields
    value_fields :collision_count, :current_number_scheduled, :desired_number_scheduled, :number_available, :number_misscheduled, :number_ready, :number_unavailable, :observed_generation, :updated_number_scheduled
    array_field(:condition) { KubeDSL::DSL::Extensions::DaemonSetCondition.new }

    def serialize
      {}.tap do |result|
        result[:collisionCount] = collision_count
        result[:currentNumberScheduled] = current_number_scheduled
        result[:desiredNumberScheduled] = desired_number_scheduled
        result[:numberAvailable] = number_available
        result[:numberMisscheduled] = number_misscheduled
        result[:numberReady] = number_ready
        result[:numberUnavailable] = number_unavailable
        result[:observedGeneration] = observed_generation
        result[:updatedNumberScheduled] = updated_number_scheduled
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
