module KubeDSL::DSL::V1
  class ScopedResourceSelectorRequirement < ::KubeDSL::DSLObject
    value_fields :operator, :scope_name, :values

    def serialize
      {}.tap do |result|
        result[:operator] = operator
        result[:scopeName] = scope_name
        result[:values] = values
      end
    end

    def kind_sym
      :scoped_resource_selector_requirement
    end
  end
end
