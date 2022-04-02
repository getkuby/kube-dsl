# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class ContainerResourceMetricSource < ::KubeDSL::DSLObject
          value_field :container
          value_field :name
          value_field :target_average_utilization
          value_field :target_average_value

          validates :container, field: { format: :string }, presence: false
          validates :name, field: { format: :string }, presence: false
          validates :target_average_utilization, field: { format: :integer }, presence: false
          validates :target_average_value, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:container] = container
              result[:name] = name
              result[:targetAverageUtilization] = target_average_utilization
              result[:targetAverageValue] = target_average_value
            end
          end

          def kind_sym
            :container_resource_metric_source
          end
        end
      end
    end
  end
end