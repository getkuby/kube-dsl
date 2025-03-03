# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class ObjectMetricSource < ::KubeDSL::DSLObject
          object_field(:described_object) { KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference.new }
          object_field(:metric) { KubeDSL::DSL::Autoscaling::V2::MetricIdentifier.new }
          object_field(:target) { KubeDSL::DSL::Autoscaling::V2::MetricTarget.new }

          validates :described_object, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference }
          validates :metric, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricIdentifier }
          validates :target, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricTarget }

          def serialize
            {}.tap do |result|
              result[:describedObject] = described_object.serialize
              result[:metric] = metric.serialize
              result[:target] = target.serialize
            end
          end

          def kind_sym
            :object_metric_source
          end
        end
      end
    end
  end
end