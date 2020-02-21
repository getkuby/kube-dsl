module KubeDSL::DSL::Autoscaling::V2beta2
  class PodsMetricStatus
    extend ::KubeDSL::ValueFields

    object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }
    object_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:current] = current.serialize
        result[:metric] = metric.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pods_metric_status
    end
  end
end
