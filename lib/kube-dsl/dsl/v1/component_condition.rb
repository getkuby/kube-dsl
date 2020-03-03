module KubeDSL::DSL::V1
  class ComponentCondition < ::KubeDSL::DSLObject
    value_fields :error, :message, :status, :type

    def serialize
      {}.tap do |result|
        result[:error] = error
        result[:message] = message
        result[:status] = status
        result[:type] = type
      end
    end

    def kind
      :component_condition
    end
  end
end
