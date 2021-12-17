module KubeDSL::DSL::V1
  class Probe < ::KubeDSL::DSLObject
    object_field(:exec) { KubeDSL::DSL::V1::ExecAction.new }
    value_field :failure_threshold
    object_field(:http_get) { KubeDSL::DSL::V1::HTTPGetAction.new }
    value_field :initial_delay_seconds
    value_field :period_seconds
    value_field :success_threshold
    object_field(:tcp_socket) { KubeDSL::DSL::V1::TCPSocketAction.new }
    value_field :termination_grace_period_seconds
    value_field :timeout_seconds

    validates :exec, object: { kind_of: KubeDSL::DSL::V1::ExecAction }
    validates :failure_threshold, field: { format: :integer }, presence: false
    validates :http_get, object: { kind_of: KubeDSL::DSL::V1::HTTPGetAction }
    validates :initial_delay_seconds, field: { format: :integer }, presence: false
    validates :period_seconds, field: { format: :integer }, presence: false
    validates :success_threshold, field: { format: :integer }, presence: false
    validates :tcp_socket, object: { kind_of: KubeDSL::DSL::V1::TCPSocketAction }
    validates :termination_grace_period_seconds, field: { format: :integer }, presence: false
    validates :timeout_seconds, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:exec] = exec.serialize
        result[:failureThreshold] = failure_threshold
        result[:httpGet] = http_get.serialize
        result[:initialDelaySeconds] = initial_delay_seconds
        result[:periodSeconds] = period_seconds
        result[:successThreshold] = success_threshold
        result[:tcpSocket] = tcp_socket.serialize
        result[:terminationGracePeriodSeconds] = termination_grace_period_seconds
        result[:timeoutSeconds] = timeout_seconds
      end
    end

    def kind_sym
      :probe
    end
  end
end
