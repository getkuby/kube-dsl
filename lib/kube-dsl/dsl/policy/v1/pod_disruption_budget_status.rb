module KubeDSL::DSL::Policy::V1
  class PodDisruptionBudgetStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Meta::V1::Condition.new }
    value_field :current_healthy
    value_field :desired_healthy
    key_value_field(:disrupted_pods, format: :string)
    value_field :disruptions_allowed
    value_field :expected_pods
    value_field :observed_generation

    validates :conditions, array: { kind_of: KubeDSL::DSL::Meta::V1::Condition }, presence: false
    validates :current_healthy, field: { format: :integer }, presence: false
    validates :desired_healthy, field: { format: :integer }, presence: false
    validates :disrupted_pods, kv: { value_format: :string }, presence: false
    validates :disruptions_allowed, field: { format: :integer }, presence: false
    validates :expected_pods, field: { format: :integer }, presence: false
    validates :observed_generation, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
        result[:currentHealthy] = current_healthy
        result[:desiredHealthy] = desired_healthy
        result[:disruptedPods] = disrupted_pods.serialize
        result[:disruptionsAllowed] = disruptions_allowed
        result[:expectedPods] = expected_pods
        result[:observedGeneration] = observed_generation
      end
    end

    def kind_sym
      :pod_disruption_budget_status
    end
  end
end
