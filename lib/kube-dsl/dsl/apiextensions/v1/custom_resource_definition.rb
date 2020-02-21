module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinition
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionSpec.new }
    object_field(:status) { KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apiextensions.k8s.io/v1"
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
