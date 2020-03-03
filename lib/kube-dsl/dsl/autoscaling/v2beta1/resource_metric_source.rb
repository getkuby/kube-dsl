module KubeDSL::DSL::Autoscaling::V2beta1
  class ResourceMetricSource < ::KubeDSL::DSLObject
    value_fields :name, :target_average_utilization, :target_average_value

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:targetAverageUtilization] = target_average_utilization
        result[:targetAverageValue] = target_average_value
      end
    end

    def kind
      :resource_metric_source
    end
  end
end
