module KubeDSL::DSL::V1
  class TopologySelectorTerm < ::KubeDSL::DSLObject
    array_field(:match_label_expression) { KubeDSL::DSL::V1::TopologySelectorLabelRequirement.new }

    def serialize
      {}.tap do |result|
        result[:matchLabelExpressions] = match_label_expressions.map(&:serialize)
      end
    end

    def kind_sym
      :topology_selector_term
    end
  end
end
