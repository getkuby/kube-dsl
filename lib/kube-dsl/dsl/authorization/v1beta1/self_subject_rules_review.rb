module KubeDSL::DSL::Authorization::V1beta1
  class SelfSubjectRulesReview < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authorization::V1beta1::SelfSubjectRulesReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authorization::V1beta1::SubjectRulesReviewStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authorization.k8s.io/v1beta1"
        result[:kind] = "SelfSubjectRulesReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :self_subject_rules_review
    end
  end
end
