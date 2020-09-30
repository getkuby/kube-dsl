module KubeDSL::DSL::V1
  class PodStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::V1::PodCondition.new }
    array_field(:container_status) { KubeDSL::DSL::V1::ContainerStatus.new }
    array_field(:ephemeral_container_status) { KubeDSL::DSL::V1::ContainerStatus.new }
    value_field :host_ip
    array_field(:init_container_status) { KubeDSL::DSL::V1::ContainerStatus.new }
    value_field :message
    value_field :nominated_node_name
    value_field :phase
    value_field :pod_ip
    array_field(:pod_ip) { KubeDSL::DSL::V1::PodIP.new }
    value_field :qos_class
    value_field :reason
    value_field :start_time

    validates :conditions, array: { kind_of: KubeDSL::DSL::V1::PodCondition }, presence: false
    validates :container_statuses, array: { kind_of: KubeDSL::DSL::V1::ContainerStatus }, presence: false
    validates :ephemeral_container_statuses, array: { kind_of: KubeDSL::DSL::V1::ContainerStatus }, presence: false
    validates :host_ip, field: { format: :string }, presence: false
    validates :init_container_statuses, array: { kind_of: KubeDSL::DSL::V1::ContainerStatus }, presence: false
    validates :message, field: { format: :string }, presence: false
    validates :nominated_node_name, field: { format: :string }, presence: false
    validates :phase, field: { format: :string }, presence: false
    validates :pod_ip, field: { format: :string }, presence: false
    validates :pod_ips, array: { kind_of: KubeDSL::DSL::V1::PodIP }, presence: false
    validates :qos_class, field: { format: :string }, presence: false
    validates :reason, field: { format: :string }, presence: false
    validates :start_time, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
        result[:containerStatuses] = container_statuses.map(&:serialize)
        result[:ephemeralContainerStatuses] = ephemeral_container_statuses.map(&:serialize)
        result[:hostIP] = host_ip
        result[:initContainerStatuses] = init_container_statuses.map(&:serialize)
        result[:message] = message
        result[:nominatedNodeName] = nominated_node_name
        result[:phase] = phase
        result[:podIP] = pod_ip
        result[:podIPs] = pod_ips.map(&:serialize)
        result[:qosClass] = qos_class
        result[:reason] = reason
        result[:startTime] = start_time
      end
    end

    def kind_sym
      :pod_status
    end
  end
end
