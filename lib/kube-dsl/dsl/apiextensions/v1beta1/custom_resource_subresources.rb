module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceSubresources
    extend ::KubeDSL::ValueFields

    value_fields :status
    object_field(:scale) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresourceScale.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:status] = status
        result[:scale] = scale.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_subresources
    end
  end
end
