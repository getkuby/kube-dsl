module KubeDSL::DSL::V1
  class TopologySelectorTerm
    extend ::KubeDSL::ValueFields

    array_field(:match_label_expression) { KubeDSL::DSL::V1::TopologySelectorLabelRequirement.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
