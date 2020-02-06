module KubeDSL::DSL::Apiextensions
  class CustomResourceDefinitionSpec
    extend ::KubeDSL::ValueFields
    value_fields :group, :preserve_unknown_fields, :scope, :version
    array_field(:additional_printer_column) { KubeDSL::DSL::Apiextensions::CustomResourceColumnDefinition.new }
    array_field(:version) { KubeDSL::DSL::Apiextensions::CustomResourceDefinitionVersion.new }
    object_field(:conversion) { KubeDSL::DSL::Apiextensions::CustomResourceConversion.new }
    object_field(:names) { KubeDSL::DSL::Apiextensions::CustomResourceDefinitionNames.new }
    object_field(:subresources) { KubeDSL::DSL::Apiextensions::CustomResourceSubresources.new }
    object_field(:validation) { KubeDSL::DSL::Apiextensions::CustomResourceValidation.new }

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:preserveUnknownFields] = preserve_unknown_fields
        result[:scope] = scope
        result[:version] = version
        result[:additionalPrinterColumns] = additional_printer_columns.map(&:serialize)
        result[:versions] = versions.map(&:serialize)
        result[:conversion] = conversion.serialize
        result[:names] = names.serialize
        result[:subresources] = subresources.serialize
        result[:validation] = validation.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
