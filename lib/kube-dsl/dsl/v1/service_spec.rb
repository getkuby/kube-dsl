module KubeDSL::DSL::V1
  class ServiceSpec < ::KubeDSL::DSLObject
    value_fields :cluster_ip, :external_name, :external_traffic_policy, :health_check_node_port, :ip_family, :load_balancer_ip, :publish_not_ready_addresses, :session_affinity, :type
    array_field :external_ip
    array_field :load_balancer_source_range
    array_field(:port) { KubeDSL::DSL::V1::ServicePort.new }
    array_field :topology_key
    object_field(:session_affinity_config) { KubeDSL::DSL::V1::SessionAffinityConfig.new }
    object_field(:selector) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:clusterIP] = cluster_ip
        result[:externalName] = external_name
        result[:externalTrafficPolicy] = external_traffic_policy
        result[:healthCheckNodePort] = health_check_node_port
        result[:ipFamily] = ip_family
        result[:loadBalancerIP] = load_balancer_ip
        result[:publishNotReadyAddresses] = publish_not_ready_addresses
        result[:sessionAffinity] = session_affinity
        result[:type] = type
        result[:externalIPs] = external_ips
        result[:loadBalancerSourceRanges] = load_balancer_source_ranges
        result[:ports] = ports.map(&:serialize)
        result[:topologyKeys] = topology_keys
        result[:sessionAffinityConfig] = session_affinity_config.serialize
        result[:selector] = selector.serialize
      end
    end

    def kind
      :service_spec
    end
  end
end
