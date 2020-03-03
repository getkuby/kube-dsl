module KubeDSL::DSL::Meta::V1
  class LabelSelectorRequirement < ::KubeDSL::DSLObject
    value_fields :key, :operator
    array_field :value

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:operator] = operator
        result[:values] = values
      end
    end

    def kind
      :label_selector_requirement
    end
  end
end
