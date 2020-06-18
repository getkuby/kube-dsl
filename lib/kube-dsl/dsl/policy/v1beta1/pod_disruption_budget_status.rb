module KubeDSL::DSL::Policy::V1beta1
  class PodDisruptionBudgetStatus < ::KubeDSL::DSLObject
    value_fields :current_healthy, :desired_healthy, :disruptions_allowed, :expected_pods, :observed_generation
    key_value_field(:disrupted_pods, format: :string)

    def serialize
      {}.tap do |result|
        result[:currentHealthy] = current_healthy
        result[:desiredHealthy] = desired_healthy
        result[:disruptionsAllowed] = disruptions_allowed
        result[:expectedPods] = expected_pods
        result[:observedGeneration] = observed_generation
        result[:disruptedPods] = disrupted_pods.serialize
      end
    end

    def kind_sym
      :pod_disruption_budget_status
    end
  end
end
