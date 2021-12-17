module KubeDSL::DSL::V1
  class PodSpec < ::KubeDSL::DSLObject
    value_field :active_deadline_seconds
    object_field(:affinity) { KubeDSL::DSL::V1::Affinity.new }
    value_field :automount_service_account_token
    array_field(:container) { KubeDSL::DSL::V1::Container.new }
    object_field(:dns_config) { KubeDSL::DSL::V1::PodDNSConfig.new }
    value_field :dns_policy
    value_field :enable_service_links
    array_field(:ephemeral_container) { KubeDSL::DSL::V1::EphemeralContainer.new }
    array_field(:host_alias) { KubeDSL::DSL::V1::HostAlias.new }
    value_field :host_ipc
    value_field :host_network
    value_field :host_pid
    value_field :hostname
    array_field(:image_pull_secret) { KubeDSL::DSL::V1::LocalObjectReference.new }
    array_field(:init_container) { KubeDSL::DSL::V1::Container.new }
    value_field :node_name
    key_value_field(:node_selector, format: :string)
    key_value_field(:overhead, format: :string)
    value_field :preemption_policy
    value_field :priority
    value_field :priority_class_name
    array_field(:readiness_gate) { KubeDSL::DSL::V1::PodReadinessGate.new }
    value_field :restart_policy
    value_field :runtime_class_name
    value_field :scheduler_name
    object_field(:security_context) { KubeDSL::DSL::V1::PodSecurityContext.new }
    value_field :service_account
    value_field :service_account_name
    value_field :set_hostname_as_fqdn
    value_field :share_process_namespace
    value_field :subdomain
    value_field :termination_grace_period_seconds
    array_field(:toleration) { KubeDSL::DSL::V1::Toleration.new }
    array_field(:topology_spread_constraint) { KubeDSL::DSL::V1::TopologySpreadConstraint.new }
    array_field(:volume) { KubeDSL::DSL::V1::Volume.new }

    validates :active_deadline_seconds, field: { format: :integer }, presence: false
    validates :affinity, object: { kind_of: KubeDSL::DSL::V1::Affinity }
    validates :automount_service_account_token, field: { format: :boolean }, presence: false
    validates :containers, array: { kind_of: KubeDSL::DSL::V1::Container }, presence: false
    validates :dns_config, object: { kind_of: KubeDSL::DSL::V1::PodDNSConfig }
    validates :dns_policy, field: { format: :string }, presence: false
    validates :enable_service_links, field: { format: :boolean }, presence: false
    validates :ephemeral_containers, array: { kind_of: KubeDSL::DSL::V1::EphemeralContainer }, presence: false
    validates :host_aliases, array: { kind_of: KubeDSL::DSL::V1::HostAlias }, presence: false
    validates :host_ipc, field: { format: :boolean }, presence: false
    validates :host_network, field: { format: :boolean }, presence: false
    validates :host_pid, field: { format: :boolean }, presence: false
    validates :hostname, field: { format: :string }, presence: false
    validates :image_pull_secrets, array: { kind_of: KubeDSL::DSL::V1::LocalObjectReference }, presence: false
    validates :init_containers, array: { kind_of: KubeDSL::DSL::V1::Container }, presence: false
    validates :node_name, field: { format: :string }, presence: false
    validates :node_selector, kv: { value_format: :string }, presence: false
    validates :overhead, kv: { value_format: :string }, presence: false
    validates :preemption_policy, field: { format: :string }, presence: false
    validates :priority, field: { format: :integer }, presence: false
    validates :priority_class_name, field: { format: :string }, presence: false
    validates :readiness_gates, array: { kind_of: KubeDSL::DSL::V1::PodReadinessGate }, presence: false
    validates :restart_policy, field: { format: :string }, presence: false
    validates :runtime_class_name, field: { format: :string }, presence: false
    validates :scheduler_name, field: { format: :string }, presence: false
    validates :security_context, object: { kind_of: KubeDSL::DSL::V1::PodSecurityContext }
    validates :service_account, field: { format: :string }, presence: false
    validates :service_account_name, field: { format: :string }, presence: false
    validates :set_hostname_as_fqdn, field: { format: :boolean }, presence: false
    validates :share_process_namespace, field: { format: :boolean }, presence: false
    validates :subdomain, field: { format: :string }, presence: false
    validates :termination_grace_period_seconds, field: { format: :integer }, presence: false
    validates :tolerations, array: { kind_of: KubeDSL::DSL::V1::Toleration }, presence: false
    validates :topology_spread_constraints, array: { kind_of: KubeDSL::DSL::V1::TopologySpreadConstraint }, presence: false
    validates :volumes, array: { kind_of: KubeDSL::DSL::V1::Volume }, presence: false

    def serialize
      {}.tap do |result|
        result[:activeDeadlineSeconds] = active_deadline_seconds
        result[:affinity] = affinity.serialize
        result[:automountServiceAccountToken] = automount_service_account_token
        result[:containers] = containers.map(&:serialize)
        result[:dnsConfig] = dns_config.serialize
        result[:dnsPolicy] = dns_policy
        result[:enableServiceLinks] = enable_service_links
        result[:ephemeralContainers] = ephemeral_containers.map(&:serialize)
        result[:hostAliases] = host_aliases.map(&:serialize)
        result[:hostIPC] = host_ipc
        result[:hostNetwork] = host_network
        result[:hostPID] = host_pid
        result[:hostname] = hostname
        result[:imagePullSecrets] = image_pull_secrets.map(&:serialize)
        result[:initContainers] = init_containers.map(&:serialize)
        result[:nodeName] = node_name
        result[:nodeSelector] = node_selector.serialize
        result[:overhead] = overhead.serialize
        result[:preemptionPolicy] = preemption_policy
        result[:priority] = priority
        result[:priorityClassName] = priority_class_name
        result[:readinessGates] = readiness_gates.map(&:serialize)
        result[:restartPolicy] = restart_policy
        result[:runtimeClassName] = runtime_class_name
        result[:schedulerName] = scheduler_name
        result[:securityContext] = security_context.serialize
        result[:serviceAccount] = service_account
        result[:serviceAccountName] = service_account_name
        result[:setHostnameAsFQDN] = set_hostname_as_fqdn
        result[:shareProcessNamespace] = share_process_namespace
        result[:subdomain] = subdomain
        result[:terminationGracePeriodSeconds] = termination_grace_period_seconds
        result[:tolerations] = tolerations.map(&:serialize)
        result[:topologySpreadConstraints] = topology_spread_constraints.map(&:serialize)
        result[:volumes] = volumes.map(&:serialize)
      end
    end

    def kind_sym
      :pod_spec
    end
  end
end
