module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricTarget < ::KubeDSL::DSLObject
    value_fields :average_utilization, :average_value, :type, :value

    def serialize
      {}.tap do |result|
        result[:averageUtilization] = average_utilization
        result[:averageValue] = average_value
        result[:type] = type
        result[:value] = value
      end
    end

    def kind_sym
      :metric_target
    end
  end
end
