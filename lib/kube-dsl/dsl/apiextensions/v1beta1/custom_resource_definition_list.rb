module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1beta1"
        result[:kind] = "CustomResourceDefinitionList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :custom_resource_definition_list
    end
  end
end
