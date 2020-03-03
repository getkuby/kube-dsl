module KubeDSL::DSL::Authentication::V1beta1
  class TokenReview < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authentication::V1beta1::TokenReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authentication::V1beta1::TokenReviewStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authentication.k8s.io/v1beta1"
        result[:kind] = "TokenReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :token_review
    end
  end
end
