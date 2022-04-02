# typed: true

module KubeDSL
  module DSL
    module V1
      class NodeSelectorTerm < ::KubeDSL::DSLObject
        array_field(:match_expression) { KubeDSL::DSL::V1::NodeSelectorRequirement.new }
        array_field(:match_field) { KubeDSL::DSL::V1::NodeSelectorRequirement.new }

        validates :match_expressions, array: { kind_of: KubeDSL::DSL::V1::NodeSelectorRequirement }, presence: false
        validates :match_fields, array: { kind_of: KubeDSL::DSL::V1::NodeSelectorRequirement }, presence: false

        def serialize
          {}.tap do |result|
            result[:matchExpressions] = match_expressions.map(&:serialize)
            result[:matchFields] = match_fields.map(&:serialize)
          end
        end

        def kind_sym
          :node_selector_term
        end
      end
    end
  end
end