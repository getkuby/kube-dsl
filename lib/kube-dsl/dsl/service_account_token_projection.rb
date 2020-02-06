module KubeDSL::DSL
  class ServiceAccountTokenProjection
    extend ::KubeDSL::ValueFields
    value_fields :audience, :expiration_seconds, :path

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
  end
end
