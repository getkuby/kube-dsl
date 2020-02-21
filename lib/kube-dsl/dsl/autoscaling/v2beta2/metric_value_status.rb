module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricValueStatus
    extend ::KubeDSL::ValueFields

    value_fields :average_utilization, :average_value, :value

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:averageUtilization] = average_utilization
        result[:averageValue] = average_value
        result[:value] = value
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :metric_value_status
    end
  end
end
