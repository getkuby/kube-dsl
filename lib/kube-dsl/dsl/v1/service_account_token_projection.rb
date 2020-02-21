module KubeDSL::DSL::V1
  class ServiceAccountTokenProjection
    extend ::KubeDSL::ValueFields

    value_fields :audience, :expiration_seconds, :path

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:audience] = audience
        result[:expirationSeconds] = expiration_seconds
        result[:path] = path
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service_account_token_projection
    end
  end
end
