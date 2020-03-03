module KubeDSL::DSL::Autoscaling::V2beta2
  class ResourceMetricSource < ::KubeDSL::DSLObject
    value_fields :name
    object_field(:target) { KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:target] = target.serialize
      end
    end

    def kind
      :resource_metric_source
    end
  end
end
