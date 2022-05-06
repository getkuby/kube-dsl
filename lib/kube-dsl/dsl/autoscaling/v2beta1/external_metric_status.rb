# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class ExternalMetricStatus < ::KubeDSL::DSLObject
          value_field :current_average_value
          value_field :current_value
          value_field :metric_name
          object_field(:metric_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

          validates :current_average_value, field: { format: :string }, presence: false
          validates :current_value, field: { format: :string }, presence: false
          validates :metric_name, field: { format: :string }, presence: false
          validates :metric_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }

          def serialize
            {}.tap do |result|
              result[:currentAverageValue] = current_average_value
              result[:currentValue] = current_value
              result[:metricName] = metric_name
              result[:metricSelector] = metric_selector.serialize
            end
          end

          def kind_sym
            :external_metric_status
          end
        end
      end
    end
  end
end