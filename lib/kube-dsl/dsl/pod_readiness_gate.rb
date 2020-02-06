module KubeDSL::DSL
  class PodReadinessGate
    extend ::KubeDSL::ValueFields

    value_fields :condition_type

    def serialize
      {}.tap do |result|
        result[:conditionType] = condition_type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_readiness_gate
    end
  end
end
