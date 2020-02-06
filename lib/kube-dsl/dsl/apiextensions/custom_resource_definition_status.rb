module KubeDSL::DSL::Apiextensions
  class CustomResourceDefinitionStatus
    extend ::KubeDSL::ValueFields
    array_field(:condition) { KubeDSL::DSL::Apiextensions::CustomResourceDefinitionCondition.new }
    array_field :stored_version
    object_field(:accepted_names) { KubeDSL::DSL::Apiextensions::CustomResourceDefinitionNames.new }

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
        result[:storedVersions] = stored_versions
        result[:acceptedNames] = accepted_names.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
