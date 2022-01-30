# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class ObjectMetricStatus < ::KubeDSL::DSLObject
    object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }
    object_field(:described_object) { KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference.new }
    object_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier.new }

    validates :current, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus }
    validates :described_object, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference }
    validates :metric, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier }

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
