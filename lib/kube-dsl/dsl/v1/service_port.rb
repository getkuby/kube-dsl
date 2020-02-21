module KubeDSL::DSL::V1
  class ServicePort
    extend ::KubeDSL::ValueFields

    value_fields :name, :node_port, :port, :protocol, :target_port

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:nodePort] = node_port
        result[:port] = port
        result[:protocol] = protocol
        result[:targetPort] = target_port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service_port
    end
  end
end
