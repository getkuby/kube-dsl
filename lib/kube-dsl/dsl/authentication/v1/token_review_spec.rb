# typed: true

module KubeDSL
  module DSL
    module Authentication
      module V1
        class TokenReviewSpec < ::KubeDSL::DSLObject
          value_field :audiences
          value_field :token

          validates :audiences, field: { format: :string }, presence: false
          validates :token, field: { format: :string }, presence: false

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
    end
  end
end