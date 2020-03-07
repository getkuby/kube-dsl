module KubeDSL::DSL::V1
  class NodeCondition < ::KubeDSL::DSLObject
    value_fields :last_heartbeat_time, :last_transition_time, :message, :reason, :status, :type

    def serialize
      {}.tap do |result|
        result[:lastHeartbeatTime] = last_heartbeat_time
        result[:lastTransitionTime] = last_transition_time
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def kind_sym
      :node_condition
    end
  end
end
