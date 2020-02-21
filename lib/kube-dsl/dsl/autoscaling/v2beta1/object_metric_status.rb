module KubeDSL::DSL::Autoscaling::V2beta1
  class ObjectMetricStatus
    extend ::KubeDSL::ValueFields

    value_fields :average_value, :current_value, :metric_name
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:target) { KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:averageValue] = average_value
        result[:currentValue] = current_value
        result[:metricName] = metric_name
        result[:selector] = selector.serialize
        result[:target] = target.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :object_metric_status
    end
  end
end
