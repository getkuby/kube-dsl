module KubeDSL::DSL::Authentication::V1beta1
  class TokenReviewStatus < ::KubeDSL::DSLObject
    value_fields :authenticated, :error
    array_field :audience
    object_field(:user) { KubeDSL::DSL::Authentication::V1beta1::UserInfo.new }

    def serialize
      {}.tap do |result|
        result[:authenticated] = authenticated
        result[:error] = error
        result[:audiences] = audiences
        result[:user] = user.serialize
      end
    end

    def kind_sym
      :token_review_status
    end
  end
end
