module KubeDSL::DSL::Autoscaling
  class ResourceMetricSource
    extend ::KubeDSL::ValueFields

    value_fields :name
    object_field(:target) { KubeDSL::DSL::Autoscaling::MetricTarget.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:target] = target.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_metric_source
    end
  end
end
