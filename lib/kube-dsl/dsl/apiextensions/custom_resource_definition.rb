module KubeDSL::DSL::Apiextensions
  class CustomResourceDefinition
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apiextensions::CustomResourceDefinitionSpec.new }
    object_field(:status) { KubeDSL::DSL::Apiextensions::CustomResourceDefinitionStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1beta1"
        result[:kind] = "CustomResourceDefinition"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_definition
    end
  end
end
