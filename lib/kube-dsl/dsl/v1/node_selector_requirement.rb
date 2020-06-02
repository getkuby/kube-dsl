module KubeDSL::DSL::V1
  class NodeSelectorRequirement < ::KubeDSL::DSLObject
    value_fields :key, :operator, :values

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:operator] = operator
        result[:values] = values
      end
    end

    def kind_sym
      :node_selector_requirement
    end
  end
end
