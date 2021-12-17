module KubeDSL::DSL::Storage::V1
  class TokenRequest < ::KubeDSL::DSLObject
    value_field :audience
    value_field :expiration_seconds

    validates :audience, field: { format: :string }, presence: false
    validates :expiration_seconds, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:audience] = audience
        result[:expirationSeconds] = expiration_seconds
      end
    end

    def kind_sym
      :token_request
    end
  end
end
