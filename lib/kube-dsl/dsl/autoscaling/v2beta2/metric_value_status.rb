# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class MetricValueStatus < ::KubeDSL::DSLObject
          value_field :average_utilization
          value_field :average_value
          value_field :value

          validates :average_utilization, field: { format: :integer }, presence: false
          validates :average_value, field: { format: :string }, presence: false
          validates :value, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:averageUtilization] = average_utilization
              result[:averageValue] = average_value
              result[:value] = value
            end
          end

          def kind_sym
            :metric_value_status
          end
        end
      end
    end
  end
end