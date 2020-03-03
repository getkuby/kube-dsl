module KubeDSL::DSL::Autoscaling::V2beta1
  class PodsMetricSource < ::KubeDSL::DSLObject
    value_fields :metric_name, :target_average_value
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:metricName] = metric_name
        result[:targetAverageValue] = target_average_value
        result[:selector] = selector.serialize
      end
    end

    def kind
      :pods_metric_source
    end
  end
end
