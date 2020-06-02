module KubeDSL::DSL::Authentication::V1
  class TokenReviewSpec < ::KubeDSL::DSLObject
    value_fields :audiences, :token

    def serialize
      {}.tap do |result|
        result[:audiences] = audiences
        result[:token] = token
      end
    end

    def kind_sym
      :token_review_spec
    end
  end
end
