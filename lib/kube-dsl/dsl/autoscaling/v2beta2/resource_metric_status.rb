module KubeDSL::DSL::Autoscaling::V2beta2
  class ResourceMetricStatus
    extend ::KubeDSL::ValueFields

    value_fields :name
    object_field(:current) { KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:current] = current.serialize
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
