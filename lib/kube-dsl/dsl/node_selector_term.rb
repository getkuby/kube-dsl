module KubeDSL::DSL
  class NodeSelectorTerm
    extend ::KubeDSL::ValueFields

    array_field(:match_expression) { KubeDSL::DSL::NodeSelectorRequirement.new }
    array_field(:match_field) { KubeDSL::DSL::NodeSelectorRequirement.new }

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
        result[:matchFields] = match_fields.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_selector_term
    end
  end
end
