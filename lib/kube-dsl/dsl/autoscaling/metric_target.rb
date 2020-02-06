module KubeDSL::DSL::Autoscaling
  class MetricTarget
    extend ::KubeDSL::ValueFields

    value_fields :average_utilization, :average_value, :type, :value

    def serialize
      {}.tap do |result|
        result[:averageUtilization] = average_utilization
        result[:averageValue] = average_value
        result[:type] = type
        result[:value] = value
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :metric_target
    end
  end
end
