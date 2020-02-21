module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionCondition.new }
    array_field :stored_version
    object_field(:accepted_names) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionNames.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :custom_resource_definition_status
    end
  end
end
