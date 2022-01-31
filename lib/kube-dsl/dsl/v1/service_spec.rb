# typed: true

module KubeDSL::DSL::V1
  class ServiceSpec < ::KubeDSL::DSLObject
    value_field :allocate_load_balancer_node_ports
    value_field :cluster_ip
    value_field :cluster_i_ps
    value_field :external_i_ps
    value_field :external_name
    value_field :external_traffic_policy
    value_field :health_check_node_port
    value_field :internal_traffic_policy
    value_field :ip_families
    value_field :ip_family_policy
    value_field :load_balancer_class
    value_field :load_balancer_ip
    value_field :load_balancer_source_ranges
    array_field(:port) { KubeDSL::DSL::V1::ServicePort.new }
    value_field :publish_not_ready_addresses
    key_value_field(:selector, format: :string)
    value_field :session_affinity
    object_field(:session_affinity_config) { KubeDSL::DSL::V1::SessionAffinityConfig.new }
    value_field :type

    validates :allocate_load_balancer_node_ports, field: { format: :boolean }, presence: false
    validates :cluster_ip, field: { format: :string }, presence: false
    validates :cluster_i_ps, field: { format: :string }, presence: false
    validates :external_i_ps, field: { format: :string }, presence: false
    validates :external_name, field: { format: :string }, presence: false
    validates :external_traffic_policy, field: { format: :string }, presence: false
    validates :health_check_node_port, field: { format: :integer }, presence: false
    validates :internal_traffic_policy, field: { format: :string }, presence: false
    validates :ip_families, field: { format: :string }, presence: false
    validates :ip_family_policy, field: { format: :string }, presence: false
    validates :load_balancer_class, field: { format: :string }, presence: false
    validates :load_balancer_ip, field: { format: :string }, presence: false
    validates :load_balancer_source_ranges, field: { format: :string }, presence: false
    validates :ports, array: { kind_of: KubeDSL::DSL::V1::ServicePort }, presence: false
    validates :publish_not_ready_addresses, field: { format: :boolean }, presence: false
    validates :selector, kv: { value_format: :string }, presence: false
    validates :session_affinity, field: { format: :string }, presence: false
    validates :session_affinity_config, object: { kind_of: KubeDSL::DSL::V1::SessionAffinityConfig }
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:allocateLoadBalancerNodePorts] = allocate_load_balancer_node_ports
        result[:clusterIP] = cluster_ip
        result[:clusterIPs] = cluster_i_ps
        result[:externalIPs] = external_i_ps
        result[:externalName] = external_name
        result[:externalTrafficPolicy] = external_traffic_policy
        result[:healthCheckNodePort] = health_check_node_port
        result[:internalTrafficPolicy] = internal_traffic_policy
        result[:ipFamilies] = ip_families
        result[:ipFamilyPolicy] = ip_family_policy
        result[:loadBalancerClass] = load_balancer_class
        result[:loadBalancerIP] = load_balancer_ip
        result[:loadBalancerSourceRanges] = load_balancer_source_ranges
        result[:ports] = ports.map(&:serialize)
        result[:publishNotReadyAddresses] = publish_not_ready_addresses
        result[:selector] = selector.serialize
        result[:sessionAffinity] = session_affinity
        result[:sessionAffinityConfig] = session_affinity_config.serialize
        result[:type] = type
      end
    end

    def kind_sym
      :service_spec
    end
  end
end
