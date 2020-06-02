module KubeDSL::DSL::Meta::V1
  class LabelSelectorRequirement < ::KubeDSL::DSLObject
    value_fields :key, :operator, :values

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
