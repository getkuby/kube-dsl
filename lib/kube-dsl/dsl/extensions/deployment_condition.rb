module KubeDSL::DSL::Extensions
  class DeploymentCondition
    extend ::KubeDSL::ValueFields
    value_fields :last_transition_time, :last_update_time, :message, :reason, :status, :type

    def serialize
      {}.tap do |result|
        result[:lastTransitionTime] = last_transition_time
        result[:lastUpdateTime] = last_update_time
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
