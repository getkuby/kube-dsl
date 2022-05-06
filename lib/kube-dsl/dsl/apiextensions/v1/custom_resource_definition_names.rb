# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceDefinitionNames < ::KubeDSL::DSLObject
          value_field :categories
          value_field :kind
          value_field :list_kind
          value_field :plural
          value_field :short_names
          value_field :singular

          validates :categories, field: { format: :string }, presence: false
          validates :kind, field: { format: :string }, presence: false
          validates :list_kind, field: { format: :string }, presence: false
          validates :plural, field: { format: :string }, presence: false
          validates :short_names, field: { format: :string }, presence: false
          validates :singular, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:categories] = categories
              result[:kind] = kind
              result[:listKind] = list_kind
              result[:plural] = plural
              result[:shortNames] = short_names
              result[:singular] = singular
            end
          end

          def kind_sym
            :custom_resource_definition_names
          end
        end
      end
    end
  end
end