module KubeDSL::DSL::V1
  class ContainerPort
    extend ::KubeDSL::ValueFields

    value_fields :container_port, :host_ip, :host_port, :name, :protocol

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:containerPort] = container_port
        result[:hostIP] = host_ip
        result[:hostPort] = host_port
        result[:name] = name
        result[:protocol] = protocol
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :container_port
    end
  end
end
