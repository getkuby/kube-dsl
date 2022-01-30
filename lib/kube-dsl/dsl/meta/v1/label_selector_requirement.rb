# typed: true

module KubeDSL::DSL::Meta::V1
  class LabelSelectorRequirement < ::KubeDSL::DSLObject
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
      :label_selector_requirement
    end
  end
end
