module KubeDSL::DSL
  class ScopedResourceSelectorRequirement
    extend ::KubeDSL::ValueFields

    value_fields :operator, :scope_name
    array_field :value

    def serialize
      {}.tap do |result|
        result[:operator] = operator
        result[:scopeName] = scope_name
        result[:values] = values
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :scoped_resource_selector_requirement
    end
  end
end
