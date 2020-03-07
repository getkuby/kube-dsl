module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionVersion < ::KubeDSL::DSLObject
    value_fields :name, :served, :storage
    array_field(:additional_printer_column) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceColumnDefinition.new }
    object_field(:schema) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceValidation.new }
    object_field(:subresources) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresources.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:served] = served
        result[:storage] = storage
        result[:additionalPrinterColumns] = additional_printer_columns.map(&:serialize)
        result[:schema] = schema.serialize
        result[:subresources] = subresources.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_version
    end
  end
end
