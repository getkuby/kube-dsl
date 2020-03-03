module KubeDSL::DSL::Autoscaling::V2beta1
  class PodsMetricStatus < ::KubeDSL::DSLObject
    value_fields :current_average_value, :metric_name
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:currentAverageValue] = current_average_value
        result[:metricName] = metric_name
        result[:selector] = selector.serialize
      end
    end

    def kind
      :pods_metric_status
    end
  end
end
