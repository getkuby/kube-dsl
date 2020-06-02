module KubeDSL::DSL::Authentication::V1
  class TokenReviewStatus < ::KubeDSL::DSLObject
    value_fields :audiences, :authenticated, :error
    object_field(:user) { KubeDSL::DSL::Authentication::V1::UserInfo.new }

    def serialize
      {}.tap do |result|
        result[:audiences] = audiences
        result[:authenticated] = authenticated
        result[:error] = error
        result[:user] = user.serialize
      end
    end

    def kind_sym
      :token_review_status
    end
  end
end
