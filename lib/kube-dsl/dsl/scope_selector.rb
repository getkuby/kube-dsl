module KubeDSL::DSL
  class ScopeSelector
    extend ::KubeDSL::ValueFields

    array_field(:match_expression) { KubeDSL::DSL::ScopedResourceSelectorRequirement.new }

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :scope_selector
    end
  end
end
