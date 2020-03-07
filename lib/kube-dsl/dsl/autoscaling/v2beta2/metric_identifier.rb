module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricIdentifier < ::KubeDSL::DSLObject
    value_fields :name
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:selector] = selector.serialize
      end
    end

    def kind_sym
      :metric_identifier
    end
  end
end
