module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricSpec < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:external) { KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricSource.new }
    object_field(:object) { KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricSource.new }
    object_field(:pods) { KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricSource.new }
    object_field(:resource) { KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricSource.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:external] = external.serialize
        result[:object] = object.serialize
        result[:pods] = pods.serialize
        result[:resource] = resource.serialize
      end
    end

    def kind_sym
      :metric_spec
    end
  end
end
