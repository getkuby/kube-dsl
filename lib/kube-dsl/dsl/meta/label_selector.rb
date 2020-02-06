module KubeDSL::DSL::Meta
  class LabelSelector
    extend ::KubeDSL::ValueFields
    array_field(:match_expression) { KubeDSL::DSL::Meta::LabelSelectorRequirement.new }
    object_field(:match_labels) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
        result[:matchLabels] = match_labels.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
