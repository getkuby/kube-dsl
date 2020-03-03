module KubeDSL::DSL::V1
  class PodReadinessGate < ::KubeDSL::DSLObject
    value_fields :condition_type

    def serialize
      {}.tap do |result|
        result[:conditionType] = condition_type
      end
    end

    def kind
      :pod_readiness_gate
    end
  end
end
