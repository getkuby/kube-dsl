module KubeDSL::DSL::V1
  class TopologySelectorLabelRequirement < ::KubeDSL::DSLObject
    value_field :key
    value_field :values

    validates :key, field: { format: :string }, presence: false
    validates :values, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:values] = values
      end
    end

    def kind_sym
      :topology_selector_label_requirement
    end
  end
end
