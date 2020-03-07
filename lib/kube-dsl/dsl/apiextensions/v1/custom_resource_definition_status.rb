module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition.new }
    array_field :stored_version
    object_field(:accepted_names) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames.new }

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
        result[:storedVersions] = stored_versions
        result[:acceptedNames] = accepted_names.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_status
    end
  end
end
