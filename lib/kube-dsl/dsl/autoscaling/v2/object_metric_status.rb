# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class ObjectMetricStatus < ::KubeDSL::DSLObject
          object_field(:current) { KubeDSL::DSL::Autoscaling::V2::MetricValueStatus.new }
          object_field(:described_object) { KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference.new }
          object_field(:metric) { KubeDSL::DSL::Autoscaling::V2::MetricIdentifier.new }

          validates :current, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricValueStatus }
          validates :described_object, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference }
          validates :metric, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricIdentifier }

          def serialize
            {}.tap do |result|
              result[:current] = current.serialize
              result[:describedObject] = described_object.serialize
              result[:metric] = metric.serialize
            end
          end

          def kind_sym
            :object_metric_status
          end
        end
      end
    end
  end
end