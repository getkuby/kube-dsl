# typed: strict

module KubeDSL
  module DSL
    module V1
      class ScopedResourceSelectorRequirement < ::KubeDSL::DSLObject
        value_field :operator
        value_field :scope_name
        value_field :values

        validates :operator, field: { format: :string }, presence: false
        validates :scope_name, field: { format: :string }, presence: false
        validates :values, field: { format: :string }, presence: false

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
  end
end