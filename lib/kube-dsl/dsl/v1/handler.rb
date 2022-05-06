# typed: true

module KubeDSL
  module DSL
    module V1
      class Handler < ::KubeDSL::DSLObject
        object_field(:exec) { KubeDSL::DSL::V1::ExecAction.new }
        object_field(:http_get) { KubeDSL::DSL::V1::HTTPGetAction.new }
        object_field(:tcp_socket) { KubeDSL::DSL::V1::TCPSocketAction.new }

        validates :exec, object: { kind_of: KubeDSL::DSL::V1::ExecAction }
        validates :http_get, object: { kind_of: KubeDSL::DSL::V1::HTTPGetAction }
        validates :tcp_socket, object: { kind_of: KubeDSL::DSL::V1::TCPSocketAction }

        def serialize
          {}.tap do |result|
            result[:exec] = exec.serialize
            result[:httpGet] = http_get.serialize
            result[:tcpSocket] = tcp_socket.serialize
          end
        end

        def kind_sym
          :handler
        end
      end
    end
  end
end