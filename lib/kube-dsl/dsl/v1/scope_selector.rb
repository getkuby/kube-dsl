module KubeDSL::DSL::V1
  class ScopeSelector
    extend ::KubeDSL::ValueFields

    array_field(:match_expression) { KubeDSL::DSL::V1::ScopedResourceSelectorRequirement.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
