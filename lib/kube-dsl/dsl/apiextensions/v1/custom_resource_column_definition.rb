# typed: true

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceColumnDefinition < ::KubeDSL::DSLObject
          value_field :description
          value_field :format
          value_field :json_path
          value_field :name
          value_field :priority
          value_field :type

          validates :description, field: { format: :string }, presence: false
          validates :format, field: { format: :string }, presence: false
          validates :json_path, field: { format: :string }, presence: false
          validates :name, field: { format: :string }, presence: false
          validates :priority, field: { format: :integer }, presence: false
          validates :type, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:description] = description
              result[:format] = format
              result[:jsonPath] = json_path
              result[:name] = name
              result[:priority] = priority
              result[:type] = type
            end
          end

          def kind_sym
            :custom_resource_column_definition
          end
        end
      end
    end
  end
end