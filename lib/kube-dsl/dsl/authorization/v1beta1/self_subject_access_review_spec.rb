module KubeDSL::DSL::Authorization::V1beta1
  class SelfSubjectAccessReviewSpec < ::KubeDSL::DSLObject
    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::V1beta1::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::V1beta1::ResourceAttributes.new }

    validates :non_resource_attributes, object: { kind_of: KubeDSL::DSL::Authorization::V1beta1::NonResourceAttributes }
    validates :resource_attributes, object: { kind_of: KubeDSL::DSL::Authorization::V1beta1::ResourceAttributes }

    def serialize
      {}.tap do |result|
        result[:nonResourceAttributes] = non_resource_attributes.serialize
        result[:resourceAttributes] = resource_attributes.serialize
      end
    end

    def kind_sym
      :self_subject_access_review_spec
    end
  end
end
