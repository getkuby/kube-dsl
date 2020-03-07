module KubeDSL::DSL::V1
  class ContainerPort < ::KubeDSL::DSLObject
    value_fields :container_port, :host_ip, :host_port, :name, :protocol

    def serialize
      {}.tap do |result|
        result[:containerPort] = container_port
        result[:hostIP] = host_ip
        result[:hostPort] = host_port
        result[:name] = name
        result[:protocol] = protocol
      end
    end

    def kind_sym
      :container_port
    end
  end
end
