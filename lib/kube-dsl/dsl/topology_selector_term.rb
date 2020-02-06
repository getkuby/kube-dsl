module KubeDSL::DSL
  class TopologySelectorTerm
    extend ::KubeDSL::ValueFields

    array_field(:match_label_expression) { KubeDSL::DSL::TopologySelectorLabelRequirement.new }

    def serialize
      {}.tap do |result|
        result[:matchLabelExpressions] = match_label_expressions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :topology_selector_term
    end
  end
end
