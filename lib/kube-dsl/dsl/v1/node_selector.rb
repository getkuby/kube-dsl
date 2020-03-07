module KubeDSL::DSL::V1
  class NodeSelector < ::KubeDSL::DSLObject
    array_field(:node_selector_term) { KubeDSL::DSL::V1::NodeSelectorTerm.new }

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
