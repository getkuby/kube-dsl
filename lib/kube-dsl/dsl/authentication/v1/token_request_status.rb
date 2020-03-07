module KubeDSL::DSL::Authentication::V1
  class TokenRequestStatus < ::KubeDSL::DSLObject
    value_fields :expiration_timestamp, :token

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
