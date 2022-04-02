# typed: true

module KubeDSL
  module DSL
    module V1
      class ScopeSelector < ::KubeDSL::DSLObject
        array_field(:match_expression) { KubeDSL::DSL::V1::ScopedResourceSelectorRequirement.new }

        validates :match_expressions, array: { kind_of: KubeDSL::DSL::V1::ScopedResourceSelectorRequirement }, presence: false

        def serialize
          {}.tap do |result|
            result[:matchExpressions] = match_expressions.map(&:serialize)
          end
        end

        def kind_sym
          :scope_selector
        end
      end
    end
  end
end