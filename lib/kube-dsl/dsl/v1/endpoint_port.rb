module KubeDSL::DSL::V1
  class EndpointPort < ::KubeDSL::DSLObject
    value_fields :name, :port, :protocol

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def kind
      :endpoint_port
    end
  end
end
