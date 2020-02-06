module KubeDSL::DSL::Autoscaling
  class ObjectMetricSource
    extend ::KubeDSL::ValueFields
    object_field(:described_object) { KubeDSL::DSL::Autoscaling::CrossVersionObjectReference.new }
    object_field(:metric) { KubeDSL::DSL::Autoscaling::MetricIdentifier.new }
    object_field(:target) { KubeDSL::DSL::Autoscaling::MetricTarget.new }

    def serialize
      {}.tap do |result|
        result[:describedObject] = described_object.serialize
        result[:metric] = metric.serialize
        result[:target] = target.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
