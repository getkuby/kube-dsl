module KubeDSL::DSL::Discovery::V1beta1
  class EndpointConditions < ::KubeDSL::DSLObject
    value_fields :ready

    def serialize
      {}.tap do |result|
        result[:ready] = ready
      end
    end

    def kind_sym
      :endpoint_conditions
    end
  end
end
