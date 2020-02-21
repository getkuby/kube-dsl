module KubeDSL::DSL::Autoscaling::V2beta2
  class ObjectMetricStatus
    extend ::KubeDSL::ValueFields

    object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }
    object_field(:described_object) { KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference.new }
    object_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:current] = current.serialize
        result[:describedObject] = described_object.serialize
        result[:metric] = metric.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :object_metric_status
    end
  end
end
