module KubeDSL::DSL::V1
  class EndpointPort
    extend ::KubeDSL::ValueFields

    value_fields :name, :port, :protocol

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :endpoint_port
    end
  end
end
