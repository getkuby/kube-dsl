module KubeDSL::DSL::V1
  class ServicePort < ::KubeDSL::DSLObject
    value_fields :name, :node_port, :port, :protocol, :target_port

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:nodePort] = node_port
        result[:port] = port
        result[:protocol] = protocol
        result[:targetPort] = target_port
      end
    end

    def kind
      :service_port
    end
  end
end
