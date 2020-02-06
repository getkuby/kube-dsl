module KubeDSL::DSL::Autoscaling
  class ObjectMetricStatus
    extend ::KubeDSL::ValueFields
    object_field(:current) { KubeDSL::DSL::Autoscaling::MetricValueStatus.new }
    object_field(:described_object) { KubeDSL::DSL::Autoscaling::CrossVersionObjectReference.new }
    object_field(:metric) { KubeDSL::DSL::Autoscaling::MetricIdentifier.new }

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
  end
end
