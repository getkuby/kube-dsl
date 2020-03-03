module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricValueStatus < ::KubeDSL::DSLObject
    value_fields :average_utilization, :average_value, :value

    def serialize
      {}.tap do |result|
        result[:averageUtilization] = average_utilization
        result[:averageValue] = average_value
        result[:value] = value
      end
    end

    def kind
      :metric_value_status
    end
  end
end
