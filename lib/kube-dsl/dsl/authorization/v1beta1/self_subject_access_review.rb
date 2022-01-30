# typed: true

module KubeDSL::DSL::Authorization::V1beta1
  class SelfSubjectAccessReview < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authorization::V1beta1::SelfSubjectAccessReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authorization::V1beta1::SubjectAccessReviewStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Authorization::V1beta1::SelfSubjectAccessReviewSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Authorization::V1beta1::SubjectAccessReviewStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authorization.k8s.io/v1beta1"
        result[:kind] = "SelfSubjectAccessReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :self_subject_access_review
    end
  end
end
