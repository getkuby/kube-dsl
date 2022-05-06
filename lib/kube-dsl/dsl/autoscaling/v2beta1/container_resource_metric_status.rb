# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class ContainerResourceMetricStatus < ::KubeDSL::DSLObject
          value_field :container
          value_field :current_average_utilization
          value_field :current_average_value
          value_field :name

          validates :container, field: { format: :string }, presence: false
          validates :current_average_utilization, field: { format: :integer }, presence: false
          validates :current_average_value, field: { format: :string }, presence: false
          validates :name, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:container] = container
              result[:currentAverageUtilization] = current_average_utilization
              result[:currentAverageValue] = current_average_value
              result[:name] = name
            end
          end

          def kind_sym
            :container_resource_metric_status
          end
        end
      end
    end
  end
end