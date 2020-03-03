module KubeDSL::DSL::V1
  class ScopeSelector < ::KubeDSL::DSLObject
    array_field(:match_expression) { KubeDSL::DSL::V1::ScopedResourceSelectorRequirement.new }

    def serialize
      {}.tap do |result|
        result[:matchExpressions] = match_expressions.map(&:serialize)
      end
    end

    def kind
      :scope_selector
    end
  end
end
