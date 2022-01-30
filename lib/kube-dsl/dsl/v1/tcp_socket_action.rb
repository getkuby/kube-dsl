# typed: true

module KubeDSL::DSL::V1
  class TCPSocketAction < ::KubeDSL::DSLObject
    value_field :host
    value_field :port

    validates :host, field: { format: :string }, presence: false
    validates :port, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:port] = port
      end
    end

    def kind_sym
      :tcp_socket_action
    end
  end
end
