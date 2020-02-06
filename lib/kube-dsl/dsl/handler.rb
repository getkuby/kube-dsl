module KubeDSL::DSL
  class Handler
    extend ::KubeDSL::ValueFields
    object_field(:exec) { KubeDSL::DSL::ExecAction.new }
    object_field(:http_get) { KubeDSL::DSL::HTTPGetAction.new }
    object_field(:tcp_socket) { KubeDSL::DSL::TCPSocketAction.new }

    def serialize
      {}.tap do |result|
        result[:exec] = exec.serialize
        result[:httpGet] = http_get.serialize
        result[:tcpSocket] = tcp_socket.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
