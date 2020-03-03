module KubeDSL::DSL::Policy::V1beta1
  class PodDisruptionBudgetSpec < ::KubeDSL::DSLObject
    value_fields :max_unavailable, :min_available
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
        result[:minAvailable] = min_available
        result[:selector] = selector.serialize
      end
    end

    def kind
      :pod_disruption_budget_spec
    end
  end
end
