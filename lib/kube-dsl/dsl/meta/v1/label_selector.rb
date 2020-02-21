module KubeDSL::DSL::Meta::V1
  class LabelSelector
    extend ::KubeDSL::ValueFields

    array_field(:match_expression) { KubeDSL::DSL::Meta::V1::LabelSelectorRequirement.new }
    object_field(:match_labels) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
        result[:matchLabels] = match_labels.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :label_selector
    end
  end
end
