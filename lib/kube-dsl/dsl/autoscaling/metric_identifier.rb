module KubeDSL::DSL::Autoscaling
  class MetricIdentifier
    extend ::KubeDSL::ValueFields

    value_fields :name
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:selector] = selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :metric_identifier
    end
  end
end
