module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionSpec < ::KubeDSL::DSLObject
    value_fields :group, :preserve_unknown_fields, :scope
    array_field(:version) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion.new }
    object_field(:conversion) { KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion.new }
    object_field(:names) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames.new }

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:preserveUnknownFields] = preserve_unknown_fields
        result[:scope] = scope
        result[:versions] = versions.map(&:serialize)
        result[:conversion] = conversion.serialize
        result[:names] = names.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_spec
    end
  end
end
