module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceValidation < ::KubeDSL::DSLObject
    object_field(:open_apiv3_schema) { KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps.new }

    def serialize
      {}.tap do |result|
        result[:openAPIV3Schema] = open_apiv3_schema.serialize
      end
    end

    def kind
      :custom_resource_validation
    end
  end
end
