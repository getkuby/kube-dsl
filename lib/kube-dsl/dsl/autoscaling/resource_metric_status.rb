module KubeDSL::DSL::Autoscaling
  class ResourceMetricStatus
    extend ::KubeDSL::ValueFields
    value_fields :name
    object_field(:current) { KubeDSL::DSL::Autoscaling::MetricValueStatus.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:current] = current.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
