module KubeDSL::DSL::Authentication
  class TokenReviewStatus
    extend ::KubeDSL::ValueFields

    value_fields :authenticated, :error
    array_field :audience
    object_field(:user) { KubeDSL::DSL::Authentication::UserInfo.new }

    def serialize
      {}.tap do |result|
        result[:authenticated] = authenticated
        result[:error] = error
        result[:audiences] = audiences
        result[:user] = user.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :token_review_status
    end
  end
end
