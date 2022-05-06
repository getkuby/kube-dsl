# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class ExternalMetricSource < ::KubeDSL::DSLObject
          value_field :metric_name
          object_field(:metric_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          value_field :target_average_value
          value_field :target_value

          validates :metric_name, field: { format: :string }, presence: false
          validates :metric_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :target_average_value, field: { format: :string }, presence: false
          validates :target_value, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:metricName] = metric_name
              result[:metricSelector] = metric_selector.serialize
              result[:targetAverageValue] = target_average_value
              result[:targetValue] = target_value
            end
          end

          def kind_sym
            :external_metric_source
          end
        end
      end
    end
  end
end