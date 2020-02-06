module KubeDSL::DSL
  class NodeSelector
    extend ::KubeDSL::ValueFields
    array_field(:node_selector_term) { KubeDSL::DSL::NodeSelectorTerm.new }

    def serialize
      {}.tap do |result|
        result[:nodeSelectorTerms] = node_selector_terms.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
