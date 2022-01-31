# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class HPAScalingRules < ::KubeDSL::DSLObject
    array_field(:policy) { KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingPolicy.new }
    value_field :select_policy
    value_field :stabilization_window_seconds

    validates :policies, array: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingPolicy }, presence: false
    validates :select_policy, field: { format: :string }, presence: false
    validates :stabilization_window_seconds, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:policies] = policies.map(&:serialize)
        result[:selectPolicy] = select_policy
        result[:stabilizationWindowSeconds] = stabilization_window_seconds
      end
    end

    def kind_sym
      :hpa_scaling_rules
    end
  end
end
