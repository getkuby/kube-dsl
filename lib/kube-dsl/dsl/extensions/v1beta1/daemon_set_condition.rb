module KubeDSL::DSL::Extensions::V1beta1
  class DaemonSetCondition < ::KubeDSL::DSLObject
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

    def kind_sym
      :daemon_set_condition
    end
  end
end
