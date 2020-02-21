module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1"
        result[:kind] = "CustomResourceDefinitionList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_definition_list
    end
  end
end
