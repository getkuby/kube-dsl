module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionStatus < ::KubeDSL::DSLObject
    value_fields :stored_versions
    array_field(:condition) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionCondition.new }
    object_field(:accepted_names) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionNames.new }

    def serialize
      {}.tap do |result|
        result[:storedVersions] = stored_versions
        result[:conditions] = conditions.map(&:serialize)
        result[:acceptedNames] = accepted_names.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_status
    end
  end
end
