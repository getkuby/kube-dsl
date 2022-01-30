# typed: true

module KubeDSL::DSL::Autoscaling::V2beta1
  class ResourceMetricSource < ::KubeDSL::DSLObject
    value_field :name
    value_field :target_average_utilization
    value_field :target_average_value

    validates :name, field: { format: :string }, presence: false
    validates :target_average_utilization, field: { format: :integer }, presence: false
    validates :target_average_value, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:targetAverageUtilization] = target_average_utilization
        result[:targetAverageValue] = target_average_value
      end
    end

    def kind_sym
      :resource_metric_source
    end
  end
end
