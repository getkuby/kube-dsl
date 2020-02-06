module KubeDSL::DSL::Authentication
  class TokenRequestStatus
    extend ::KubeDSL::ValueFields
    value_fields :expiration_timestamp, :token

    def serialize
      {}.tap do |result|
        result[:expirationTimestamp] = expiration_timestamp
        result[:token] = token
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
