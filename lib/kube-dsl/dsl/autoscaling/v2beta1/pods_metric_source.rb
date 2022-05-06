# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class PodsMetricSource < ::KubeDSL::DSLObject
          value_field :metric_name
          object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          value_field :target_average_value

          validates :metric_name, field: { format: :string }, presence: false
          validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :target_average_value, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:metricName] = metric_name
              result[:selector] = selector.serialize
              result[:targetAverageValue] = target_average_value
            end
          end

          def kind_sym
            :pods_metric_source
          end
        end
      end
    end
  end
end