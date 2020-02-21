module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionSpec
    extend ::KubeDSL::ValueFields

    value_fields :group, :preserve_unknown_fields, :scope, :version
    array_field(:additional_printer_column) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceColumnDefinition.new }
    array_field(:version) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionVersion.new }
    object_field(:conversion) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceConversion.new }
    object_field(:names) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionNames.new }
    object_field(:subresources) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresources.new }
    object_field(:validation) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceValidation.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :custom_resource_definition_spec
    end
  end
end
