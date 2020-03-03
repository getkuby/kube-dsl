module KubeDSL::DSL::Autoscaling::V2beta2
  class ResourceMetricStatus < ::KubeDSL::DSLObject
    value_fields :name
    object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:current] = current.serialize
      end
    end

    def kind
      :resource_metric_status
    end
  end
end
