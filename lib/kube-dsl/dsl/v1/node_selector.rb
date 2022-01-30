# typed: true

module KubeDSL::DSL::V1
  class NodeSelector < ::KubeDSL::DSLObject
    array_field(:node_selector_term) { KubeDSL::DSL::V1::NodeSelectorTerm.new }

    validates :node_selector_terms, array: { kind_of: KubeDSL::DSL::V1::NodeSelectorTerm }, presence: false

    def serialize
      {}.tap do |result|
        result[:nodeSelectorTerms] = node_selector_terms.map(&:serialize)
      end
    end

    def kind_sym
      :node_selector
    end
  end
end
