# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceDefinitionStatus < ::KubeDSL::DSLObject
          object_field(:accepted_names) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames.new }
          array_field(:condition) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition.new }
          value_field :stored_versions

          validates :accepted_names, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames }
          validates :conditions, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition }, presence: false
          validates :stored_versions, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:acceptedNames] = accepted_names.serialize
              result[:conditions] = conditions.map(&:serialize)
              result[:storedVersions] = stored_versions
            end
          end

          def kind_sym
            :custom_resource_definition_status
          end
        end
      end
    end
  end
end