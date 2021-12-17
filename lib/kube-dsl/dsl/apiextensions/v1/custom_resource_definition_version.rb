module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionVersion < ::KubeDSL::DSLObject
    array_field(:additional_printer_column) { KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition.new }
    value_field :deprecated
    value_field :deprecation_warning
    value_field :name
    object_field(:schema) { KubeDSL::DSL::Apiextensions::V1::CustomResourceValidation.new }
    value_field :served
    value_field :storage
    object_field(:subresources) { KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresources.new }

    validates :additional_printer_columns, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition }, presence: false
    validates :deprecated, field: { format: :boolean }, presence: false
    validates :deprecation_warning, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :schema, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceValidation }
    validates :served, field: { format: :boolean }, presence: false
    validates :storage, field: { format: :boolean }, presence: false
    validates :subresources, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresources }

    def serialize
      {}.tap do |result|
        result[:additionalPrinterColumns] = additional_printer_columns.map(&:serialize)
        result[:deprecated] = deprecated
        result[:deprecationWarning] = deprecation_warning
        result[:name] = name
        result[:schema] = schema.serialize
        result[:served] = served
        result[:storage] = storage
        result[:subresources] = subresources.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_version
    end
  end
end
