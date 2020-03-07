module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceSubresources < ::KubeDSL::DSLObject
    value_fields :status
    object_field(:scale) { KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresourceScale.new }

    def serialize
      {}.tap do |result|
        result[:status] = status
        result[:scale] = scale.serialize
      end
    end

    def kind_sym
      :custom_resource_subresources
    end
  end
end
