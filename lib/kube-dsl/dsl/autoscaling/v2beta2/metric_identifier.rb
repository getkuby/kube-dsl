module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricIdentifier
    extend ::KubeDSL::ValueFields

    value_fields :name
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
