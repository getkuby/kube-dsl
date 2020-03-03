module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceCondition < ::KubeDSL::DSLObject
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
      :api_service_condition
    end
  end
end
