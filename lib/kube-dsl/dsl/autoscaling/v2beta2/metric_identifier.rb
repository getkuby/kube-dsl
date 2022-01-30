# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricIdentifier < ::KubeDSL::DSLObject
    value_field :name
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    validates :name, field: { format: :string }, presence: false
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }

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
