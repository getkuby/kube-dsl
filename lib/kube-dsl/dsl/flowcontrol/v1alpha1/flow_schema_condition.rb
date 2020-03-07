module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaCondition < ::KubeDSL::DSLObject
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
      :flow_schema_condition
    end
  end
end
