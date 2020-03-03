module KubeDSL::DSL::V1
  class ServiceAccountTokenProjection < ::KubeDSL::DSLObject
    value_fields :audience, :expiration_seconds, :path

    def serialize
      {}.tap do |result|
        result[:audience] = audience
        result[:expirationSeconds] = expiration_seconds
        result[:path] = path
      end
    end

    def kind
      :service_account_token_projection
    end
  end
end
