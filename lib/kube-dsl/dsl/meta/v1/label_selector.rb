module KubeDSL::DSL::Meta::V1
  class LabelSelector < ::KubeDSL::DSLObject
    array_field(:match_expression) { KubeDSL::DSL::Meta::V1::LabelSelectorRequirement.new }
    key_value_field(:match_labels, format: :string)

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
        result[:matchLabels] = match_labels.serialize
      end
    end

    def kind_sym
      :label_selector
    end
  end
end
