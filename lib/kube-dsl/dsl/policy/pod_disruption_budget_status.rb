module KubeDSL::DSL::Policy
  class PodDisruptionBudgetStatus
    extend ::KubeDSL::ValueFields

    value_fields :current_healthy, :desired_healthy, :disruptions_allowed, :expected_pods, :observed_generation
    object_field(:disrupted_pods) { ::KubeDSL::KeyValueFields.new(format: :string) }

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_disruption_budget_status
    end
  end
end
