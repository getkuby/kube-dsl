module KubeDSL::DSL::Authorization::V1beta1
  class SubjectAccessReview < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authorization::V1beta1::SubjectAccessReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authorization::V1beta1::SubjectAccessReviewStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authorization.k8s.io/v1beta1"
        result[:kind] = "SubjectAccessReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :subject_access_review
    end
  end
end
