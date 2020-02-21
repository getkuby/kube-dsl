module KubeDSL::DSL::Autoscaling::V2beta1
  class ResourceMetricStatus
    extend ::KubeDSL::ValueFields

    value_fields :current_average_utilization, :current_average_value, :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:currentAverageUtilization] = current_average_utilization
        result[:currentAverageValue] = current_average_value
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_metric_status
    end
  end
end
