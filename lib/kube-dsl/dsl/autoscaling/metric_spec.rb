module KubeDSL::DSL::Autoscaling
  class MetricSpec
    extend ::KubeDSL::ValueFields
    value_fields :type
    object_field(:external) { KubeDSL::DSL::Autoscaling::ExternalMetricSource.new }
    object_field(:object) { KubeDSL::DSL::Autoscaling::ObjectMetricSource.new }
    object_field(:pods) { KubeDSL::DSL::Autoscaling::PodsMetricSource.new }
    object_field(:resource) { KubeDSL::DSL::Autoscaling::ResourceMetricSource.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:external] = external.serialize
        result[:object] = object.serialize
        result[:pods] = pods.serialize
        result[:resource] = resource.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
