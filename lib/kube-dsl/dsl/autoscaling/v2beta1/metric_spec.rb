module KubeDSL::DSL::Autoscaling::V2beta1
  class MetricSpec
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:external) { KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricSource.new }
    object_field(:object) { KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricSource.new }
    object_field(:pods) { KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricSource.new }
    object_field(:resource) { KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricSource.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :metric_spec
    end
  end
end
