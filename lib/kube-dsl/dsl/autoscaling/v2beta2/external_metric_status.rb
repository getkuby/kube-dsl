# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class ExternalMetricStatus < ::KubeDSL::DSLObject
          object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }
          object_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier.new }

          validates :current, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus }
          validates :metric, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier }

          def serialize
            {}.tap do |result|
              result[:current] = current.serialize
              result[:metric] = metric.serialize
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