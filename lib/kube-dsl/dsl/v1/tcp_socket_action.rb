module KubeDSL::DSL::V1
  class TCPSocketAction < ::KubeDSL::DSLObject
    value_fields :host, :port

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:port] = port
      end
    end

    def kind
      :tcp_socket_action
    end
  end
end
