module KubeDSL::DSL::Authentication::V1
  class TokenReviewSpec < ::KubeDSL::DSLObject
    value_fields :token
    array_field :audience

    def serialize
      {}.tap do |result|
        result[:token] = token
        result[:audiences] = audiences
      end
    end

    def kind_sym
      :token_review_spec
    end
  end
end
