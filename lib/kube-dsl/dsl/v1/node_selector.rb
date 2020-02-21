module KubeDSL::DSL::V1
  class NodeSelector
    extend ::KubeDSL::ValueFields

    array_field(:node_selector_term) { KubeDSL::DSL::V1::NodeSelectorTerm.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:nodeSelectorTerms] = node_selector_terms.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_selector
    end
  end
end
