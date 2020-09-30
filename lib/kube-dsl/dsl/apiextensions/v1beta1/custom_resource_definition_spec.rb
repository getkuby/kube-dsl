module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionSpec < ::KubeDSL::DSLObject
    array_field(:additional_printer_column) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceColumnDefinition.new }
    object_field(:conversion) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceConversion.new }
    value_field :group
    object_field(:names) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionNames.new }
    value_field :preserve_unknown_fields
    value_field :scope
    object_field(:subresources) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresources.new }
    object_field(:validation) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceValidation.new }
    value_field :version
    array_field(:version) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionVersion.new }

    validates :additional_printer_columns, array: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceColumnDefinition }, presence: false
    validates :conversion, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceConversion }
    validates :group, field: { format: :string }, presence: false
    validates :names, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionNames }
    validates :preserve_unknown_fields, field: { format: :boolean }, presence: false
    validates :scope, field: { format: :string }, presence: false
    validates :subresources, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresources }
    validates :validation, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceValidation }
    validates :version, field: { format: :string }, presence: false
    validates :versions, array: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionVersion }, presence: false

    def serialize
      {}.tap do |result|
        result[:additionalPrinterColumns] = additional_printer_columns.map(&:serialize)
        result[:conversion] = conversion.serialize
        result[:group] = group
        result[:names] = names.serialize
        result[:preserveUnknownFields] = preserve_unknown_fields
        result[:scope] = scope
        result[:subresources] = subresources.serialize
        result[:validation] = validation.serialize
        result[:version] = version
        result[:versions] = versions.map(&:serialize)
      end
    end

    def kind_sym
      :custom_resource_definition_spec
    end
  end
end
