module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricTarget < ::KubeDSL::DSLObject
    value_field :average_utilization
    value_field :average_value
    value_field :type
    value_field :value

    validates :average_utilization, field: { format: :integer }, presence: false
    validates :average_value, field: { format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false
    validates :value, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:averageUtilization] = average_utilization
        result[:averageValue] = average_value
        result[:type] = type
        result[:value] = value
      end
    end

    def kind_sym
      :metric_target
    end
  end
end
