module KubeDSL::DSL::Autoscaling::V2beta1
  class MetricStatus
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:external) { KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricStatus.new }
    object_field(:object) { KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricStatus.new }
    object_field(:pods) { KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricStatus.new }
    object_field(:resource) { KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricStatus.new }

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
      :metric_status
    end
  end
end
