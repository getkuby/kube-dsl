module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricStatus < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:external) { KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricStatus.new }
    object_field(:object) { KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricStatus.new }
    object_field(:pods) { KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricStatus.new }
    object_field(:resource) { KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricStatus.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:external] = external.serialize
        result[:object] = object.serialize
        result[:pods] = pods.serialize
        result[:resource] = resource.serialize
      end
    end

    def kind
      :metric_status
    end
  end
end
