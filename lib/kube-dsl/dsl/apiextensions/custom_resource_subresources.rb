module KubeDSL::DSL::Apiextensions
  class CustomResourceSubresources
    extend ::KubeDSL::ValueFields
    value_fields :status
    object_field(:scale) { KubeDSL::DSL::Apiextensions::CustomResourceSubresourceScale.new }

    def serialize
      {}.tap do |result|
        result[:status] = status
        result[:scale] = scale.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
