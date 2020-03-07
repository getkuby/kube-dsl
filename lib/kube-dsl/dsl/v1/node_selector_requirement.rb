module KubeDSL::DSL::V1
  class NodeSelectorRequirement < ::KubeDSL::DSLObject
    value_fields :key, :operator
    array_field :value

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
