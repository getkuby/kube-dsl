module KubeDSL::DSL::Authentication::V1
  class TokenRequestStatus
    extend ::KubeDSL::ValueFields

    value_fields :expiration_timestamp, :token

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:expirationTimestamp] = expiration_timestamp
        result[:token] = token
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :token_request_status
    end
  end
end
