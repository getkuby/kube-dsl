module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinition < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionSpec.new }
    object_field(:status) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1beta1"
        result[:kind] = "CustomResourceDefinition"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :custom_resource_definition
    end
  end
end
