module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionSpec < ::KubeDSL::DSLObject
    object_field(:conversion) { KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion.new }
    value_field :group
    object_field(:names) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames.new }
    value_field :preserve_unknown_fields
    value_field :scope
    array_field(:version) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion.new }

    validates :conversion, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion }
    validates :group, field: { format: :string }, presence: false
    validates :names, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames }
    validates :preserve_unknown_fields, field: { format: :boolean }, presence: false
    validates :scope, field: { format: :string }, presence: false
    validates :versions, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion }, presence: false

    def serialize
      {}.tap do |result|
        result[:conversion] = conversion.serialize
        result[:group] = group
        result[:names] = names.serialize
        result[:preserveUnknownFields] = preserve_unknown_fields
        result[:scope] = scope
        result[:versions] = versions.map(&:serialize)
      end
    end

    def kind_sym
      :custom_resource_definition_spec
    end
  end
end
