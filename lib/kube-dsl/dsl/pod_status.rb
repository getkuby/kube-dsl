module KubeDSL::DSL
  class PodStatus
    extend ::KubeDSL::ValueFields
    value_fields :host_ip, :message, :nominated_node_name, :phase, :pod_ip, :qos_class, :reason, :start_time
    array_field(:condition) { KubeDSL::DSL::PodCondition.new }
    array_field(:container_status) { KubeDSL::DSL::ContainerStatus.new }
    array_field(:ephemeral_container_status) { KubeDSL::DSL::ContainerStatus.new }
    array_field(:init_container_status) { KubeDSL::DSL::ContainerStatus.new }
    array_field(:pod_ip) { KubeDSL::DSL::PodIP.new }

    def serialize
      {}.tap do |result|
        result[:hostIP] = host_ip
        result[:message] = message
        result[:nominatedNodeName] = nominated_node_name
        result[:phase] = phase
        result[:podIP] = pod_ip
        result[:qosClass] = qos_class
        result[:reason] = reason
        result[:startTime] = start_time
        result[:conditions] = conditions.map(&:serialize)
        result[:containerStatuses] = container_statuses.map(&:serialize)
        result[:ephemeralContainerStatuses] = ephemeral_container_statuses.map(&:serialize)
        result[:initContainerStatuses] = init_container_statuses.map(&:serialize)
        result[:podIPs] = pod_ips.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
