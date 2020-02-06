module KubeDSL::DSL::Authorization
  class SelfSubjectAccessReviewSpec
    extend ::KubeDSL::ValueFields
    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::ResourceAttributes.new }

    def serialize
      {}.tap do |result|
        result[:nonResourceAttributes] = non_resource_attributes.serialize
        result[:resourceAttributes] = resource_attributes.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
