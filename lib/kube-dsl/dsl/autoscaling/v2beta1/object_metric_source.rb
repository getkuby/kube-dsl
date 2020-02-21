module KubeDSL::DSL::Autoscaling::V2beta1
  class ObjectMetricSource
    extend ::KubeDSL::ValueFields

    value_fields :average_value, :metric_name, :target_value
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:target) { KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:averageValue] = average_value
        result[:metricName] = metric_name
        result[:targetValue] = target_value
        result[:selector] = selector.serialize
        result[:target] = target.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :object_metric_source
    end
  end
end
