module KubeDSL::DSL::Apiextensions
  class CustomResourceDefinitionList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Apiextensions::CustomResourceDefinition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1beta1"
        result[:kind] = "CustomResourceDefinitionList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
