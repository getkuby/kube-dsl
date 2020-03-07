module KubeDSL::DSL::Autoscaling::V2beta1
  class ResourceMetricStatus < ::KubeDSL::DSLObject
    value_fields :current_average_utilization, :current_average_value, :name

    def serialize
      {}.tap do |result|
        result[:currentAverageUtilization] = current_average_utilization
        result[:currentAverageValue] = current_average_value
        result[:name] = name
      end
    end

    def kind_sym
      :resource_metric_status
    end
  end
end
