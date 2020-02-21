module KubeDSL::DSL::Autoscaling::V2beta1
  class ExternalMetricSource
    extend ::KubeDSL::ValueFields

    value_fields :metric_name, :target_average_value, :target_value
    object_field(:metric_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:metricName] = metric_name
        result[:targetAverageValue] = target_average_value
        result[:targetValue] = target_value
        result[:metricSelector] = metric_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :external_metric_source
    end
  end
end
