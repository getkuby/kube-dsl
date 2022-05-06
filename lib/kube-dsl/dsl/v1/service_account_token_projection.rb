# typed: true

module KubeDSL
  module DSL
    module V1
      class ServiceAccountTokenProjection < ::KubeDSL::DSLObject
        value_field :audience
        value_field :expiration_seconds
        value_field :path

        validates :audience, field: { format: :string }, presence: false
        validates :expiration_seconds, field: { format: :integer }, presence: false
        validates :path, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:audience] = audience
            result[:expirationSeconds] = expiration_seconds
            result[:path] = path
          end
        end

        def kind_sym
          :service_account_token_projection
        end
      end
    end
  end
end