module KubeDSL::DSL
  class ClientIPConfig
    extend ::KubeDSL::ValueFields
    value_fields :timeout_seconds

    def serialize
      {}.tap do |result|
        result[:timeoutSeconds] = timeout_seconds
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
