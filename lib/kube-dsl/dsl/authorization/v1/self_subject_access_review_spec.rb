module KubeDSL::DSL::Authorization::V1
  class SelfSubjectAccessReviewSpec < ::KubeDSL::DSLObject
    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::V1::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::V1::ResourceAttributes.new }

    def serialize
      {}.tap do |result|
        result[:nonResourceAttributes] = non_resource_attributes.serialize
        result[:resourceAttributes] = resource_attributes.serialize
      end
    end

    def kind
      :self_subject_access_review_spec
    end
  end
end
