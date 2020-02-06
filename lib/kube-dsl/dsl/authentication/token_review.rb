module KubeDSL::DSL::Authentication
  class TokenReview
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authentication::TokenReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authentication::TokenReviewStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authentication.k8s.io/v1beta1"
        result[:kind] = "TokenReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :token_review
    end
  end
end
