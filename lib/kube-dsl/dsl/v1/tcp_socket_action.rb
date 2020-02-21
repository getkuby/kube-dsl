module KubeDSL::DSL::V1
  class TCPSocketAction
    extend ::KubeDSL::ValueFields

    value_fields :host, :port

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:port] = port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :tcp_socket_action
    end
  end
end
