module KubeDSL::DSL::Autoscaling::V2beta1
  class ExternalMetricStatus
    extend ::KubeDSL::ValueFields

    value_fields :current_average_value, :current_value, :metric_name
    object_field(:metric_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:currentAverageValue] = current_average_value
        result[:currentValue] = current_value
        result[:metricName] = metric_name
        result[:metricSelector] = metric_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :external_metric_status
    end
  end
end
