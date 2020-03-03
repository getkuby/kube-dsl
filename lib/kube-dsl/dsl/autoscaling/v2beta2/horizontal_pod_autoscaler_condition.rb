module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerCondition < ::KubeDSL::DSLObject
    value_fields :last_transition_time, :message, :reason, :status, :type

    def serialize
      {}.tap do |result|
        result[:lastTransitionTime] = last_transition_time
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def kind
      :horizontal_pod_autoscaler_condition
    end
  end
end
