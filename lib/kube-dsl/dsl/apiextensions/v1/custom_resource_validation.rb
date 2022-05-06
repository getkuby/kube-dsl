# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceValidation < ::KubeDSL::DSLObject
          object_field(:open_apiv3_schema) { KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new }

          validates :open_apiv3_schema, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps }

          def serialize
            {}.tap do |result|
              result[:openAPIV3Schema] = open_apiv3_schema.serialize
            end
          end

          def kind_sym
            :custom_resource_validation
          end
        end
      end
    end
  end
end