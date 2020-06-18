module KubeDSL::DSL::V1
  class ServiceSpec < ::KubeDSL::DSLObject
    value_fields :cluster_ip, :external_i_ps, :external_name, :external_traffic_policy, :health_check_node_port, :ip_family, :load_balancer_ip, :load_balancer_source_ranges, :publish_not_ready_addresses, :session_affinity, :topology_keys, :type
    array_field(:port) { KubeDSL::DSL::V1::ServicePort.new }
    object_field(:session_affinity_config) { KubeDSL::DSL::V1::SessionAffinityConfig.new }
    key_value_field(:selector, format: :string)

    def serialize
      {}.tap do |result|
        result[:clusterIP] = cluster_ip
        result[:externalIPs] = external_i_ps
        result[:externalName] = external_name
        result[:externalTrafficPolicy] = external_traffic_policy
        result[:healthCheckNodePort] = health_check_node_port
        result[:ipFamily] = ip_family
        result[:loadBalancerIP] = load_balancer_ip
        result[:loadBalancerSourceRanges] = load_balancer_source_ranges
        result[:publishNotReadyAddresses] = publish_not_ready_addresses
        result[:sessionAffinity] = session_affinity
        result[:topologyKeys] = topology_keys
        result[:type] = type
        result[:ports] = ports.map(&:serialize)
        result[:sessionAffinityConfig] = session_affinity_config.serialize
        result[:selector] = selector.serialize
      end
    end

    def kind_sym
      :service_spec
    end
  end
end
