module KubeDSL::DSL::Policy::V1beta1
  class PodDisruptionBudgetSpec < ::KubeDSL::DSLObject
    value_field :max_unavailable
    value_field :min_available
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    validates :max_unavailable, field: { format: :string }, presence: false
    validates :min_available, field: { format: :string }, presence: false
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
        result[:minAvailable] = min_available
        result[:selector] = selector.serialize
      end
    end

    def kind_sym
      :pod_disruption_budget_spec
    end
  end
end
