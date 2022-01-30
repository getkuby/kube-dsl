# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class PodsMetricSource < ::KubeDSL::DSLObject
    object_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier.new }
    object_field(:target) { KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget.new }

    validates :metric, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier }
    validates :target, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget }

    def serialize
      {}.tap do |result|
        result[:metric] = metric.serialize
        result[:target] = target.serialize
      end
    end

    def kind_sym
      :pods_metric_source
    end
  end
end
