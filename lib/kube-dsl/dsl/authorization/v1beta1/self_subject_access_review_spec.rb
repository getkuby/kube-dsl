module KubeDSL::DSL::Authorization::V1beta1
  class SelfSubjectAccessReviewSpec
    extend ::KubeDSL::ValueFields

    object_field(:non_resource_attributes) { KubeDSL::DSL::Authorization::V1beta1::NonResourceAttributes.new }
    object_field(:resource_attributes) { KubeDSL::DSL::Authorization::V1beta1::ResourceAttributes.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:nonResourceAttributes] = non_resource_attributes.serialize
        result[:resourceAttributes] = resource_attributes.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :self_subject_access_review_spec
    end
  end
end
