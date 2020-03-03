module KubeDSL::DSL::V1
  class NodeSelectorTerm < ::KubeDSL::DSLObject
    array_field(:match_expression) { KubeDSL::DSL::V1::NodeSelectorRequirement.new }
    array_field(:match_field) { KubeDSL::DSL::V1::NodeSelectorRequirement.new }

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
        result[:matchFields] = match_fields.map(&:serialize)
      end
    end

    def kind
      :node_selector_term
    end
  end
end
