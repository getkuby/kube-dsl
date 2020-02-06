module KubeDSL::DSL::Apiextensions
  class CustomResourceDefinitionVersion
    extend ::KubeDSL::ValueFields
    value_fields :name, :served, :storage
    array_field(:additional_printer_column) { KubeDSL::DSL::Apiextensions::CustomResourceColumnDefinition.new }
    object_field(:schema) { KubeDSL::DSL::Apiextensions::CustomResourceValidation.new }
    object_field(:subresources) { KubeDSL::DSL::Apiextensions::CustomResourceSubresources.new }

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
