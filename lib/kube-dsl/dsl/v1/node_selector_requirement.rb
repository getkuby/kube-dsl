module KubeDSL::DSL::V1
  class NodeSelectorRequirement < ::KubeDSL::DSLObject
    value_field :key
    value_field :operator
    value_field :values

    validates :key, field: { format: :string }, presence: false
    validates :operator, field: { format: :string }, presence: false
    validates :values, field: { format: :string }, presence: false

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
