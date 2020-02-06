module KubeDSL::DSL::Apiextensions
  class CustomResourceValidation
    extend ::KubeDSL::ValueFields
    object_field(:open_apiv3_schema) { KubeDSL::DSL::Apiextensions::JSONSchemaProps.new }

    def serialize
      {}.tap do |result|
        result[:openAPIV3Schema] = open_apiv3_schema.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
