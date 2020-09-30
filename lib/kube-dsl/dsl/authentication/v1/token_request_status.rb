module KubeDSL::DSL::Authentication::V1
  class TokenRequestStatus < ::KubeDSL::DSLObject
    value_field :expiration_timestamp
    value_field :token

    validates :expiration_timestamp, field: { format: :string }, presence: false
    validates :token, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:expirationTimestamp] = expiration_timestamp
        result[:token] = token
      end
    end

    def kind_sym
      :token_request_status
    end
  end
end
