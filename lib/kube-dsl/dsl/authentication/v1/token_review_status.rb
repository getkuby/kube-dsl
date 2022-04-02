# typed: true

module KubeDSL
  module DSL
    module Authentication
      module V1
        class TokenReviewStatus < ::KubeDSL::DSLObject
          value_field :audiences
          value_field :authenticated
          value_field :error
          object_field(:user) { KubeDSL::DSL::Authentication::V1::UserInfo.new }

          validates :audiences, field: { format: :string }, presence: false
          validates :authenticated, field: { format: :boolean }, presence: false
          validates :error, field: { format: :string }, presence: false
          validates :user, object: { kind_of: KubeDSL::DSL::Authentication::V1::UserInfo }

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
    end
  end
end