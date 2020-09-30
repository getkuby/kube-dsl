module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "CustomResourceDefinitionList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_list
    end
  end
end
