module KubeDSL::DSL::Discovery::V1beta1
  class EndpointPort < ::KubeDSL::DSLObject
    value_fields :app_protocol, :name, :port, :protocol

    def serialize
      {}.tap do |result|
        result[:appProtocol] = app_protocol
        result[:name] = name
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def kind_sym
      :endpoint_port
    end
  end
end
