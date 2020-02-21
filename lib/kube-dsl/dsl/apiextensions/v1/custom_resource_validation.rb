module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceValidation
    extend ::KubeDSL::ValueFields

    object_field(:open_apiv3_schema) { KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:openAPIV3Schema] = open_apiv3_schema.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_validation
    end
  end
end
