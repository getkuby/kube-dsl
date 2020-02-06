module KubeDSL::DSL::Authorization
  class LocalSubjectAccessReview
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authorization::SubjectAccessReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authorization::SubjectAccessReviewStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authorization.k8s.io/v1beta1"
        result[:kind] = "LocalSubjectAccessReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :local_subject_access_review
    end
  end
end
