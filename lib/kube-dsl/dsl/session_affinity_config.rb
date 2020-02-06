module KubeDSL::DSL
  class SessionAffinityConfig
    extend ::KubeDSL::ValueFields
    object_field(:client_ip) { KubeDSL::DSL::ClientIPConfig.new }

    def serialize
      {}.tap do |result|
        result[:clientIP] = client_ip.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
