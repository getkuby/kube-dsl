# typed: true

module KubeDSL::DSL::Autoscaling::V2beta1
  class ObjectMetricSource < ::KubeDSL::DSLObject
    value_field :average_value
    value_field :metric_name
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:target) { KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference.new }
    value_field :target_value

    validates :average_value, field: { format: :string }, presence: false
    validates :metric_name, field: { format: :string }, presence: false
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :target, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference }
    validates :target_value, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:averageValue] = average_value
        result[:metricName] = metric_name
        result[:selector] = selector.serialize
        result[:target] = target.serialize
        result[:targetValue] = target_value
      end
    end

    def kind_sym
      :object_metric_source
    end
  end
end
