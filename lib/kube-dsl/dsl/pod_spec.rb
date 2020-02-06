module KubeDSL::DSL
  class PodSpec
    extend ::KubeDSL::ValueFields

    value_fields :active_deadline_seconds, :automount_service_account_token, :dns_policy, :enable_service_links, :host_ipc, :host_network, :host_pid, :hostname, :node_name, :preemption_policy, :priority, :priority_class_name, :restart_policy, :runtime_class_name, :scheduler_name, :service_account, :service_account_name, :share_process_namespace, :subdomain, :termination_grace_period_seconds
    array_field(:container) { KubeDSL::DSL::Container.new }
    array_field(:ephemeral_container) { KubeDSL::DSL::EphemeralContainer.new }
    array_field(:host_alias) { KubeDSL::DSL::HostAlias.new }
    array_field(:image_pull_secret) { KubeDSL::DSL::LocalObjectReference.new }
    array_field(:init_container) { KubeDSL::DSL::Container.new }
    array_field(:readiness_gate) { KubeDSL::DSL::PodReadinessGate.new }
    array_field(:toleration) { KubeDSL::DSL::Toleration.new }
    array_field(:topology_spread_constraint) { KubeDSL::DSL::TopologySpreadConstraint.new }
    array_field(:volume) { KubeDSL::DSL::Volume.new }
    object_field(:affinity) { KubeDSL::DSL::Affinity.new }
    object_field(:dns_config) { KubeDSL::DSL::PodDNSConfig.new }
    object_field(:security_context) { KubeDSL::DSL::PodSecurityContext.new }
    object_field(:node_selector) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:overhead) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:activeDeadlineSeconds] = active_deadline_seconds
        result[:automountServiceAccountToken] = automount_service_account_token
        result[:dnsPolicy] = dns_policy
        result[:enableServiceLinks] = enable_service_links
        result[:hostIPC] = host_ipc
        result[:hostNetwork] = host_network
        result[:hostPID] = host_pid
        result[:hostname] = hostname
        result[:nodeName] = node_name
        result[:preemptionPolicy] = preemption_policy
        result[:priority] = priority
        result[:priorityClassName] = priority_class_name
        result[:restartPolicy] = restart_policy
        result[:runtimeClassName] = runtime_class_name
        result[:schedulerName] = scheduler_name
        result[:serviceAccount] = service_account
        result[:serviceAccountName] = service_account_name
        result[:shareProcessNamespace] = share_process_namespace
        result[:subdomain] = subdomain
        result[:terminationGracePeriodSeconds] = termination_grace_period_seconds
        result[:containers] = containers.map(&:serialize)
        result[:ephemeralContainers] = ephemeral_containers.map(&:serialize)
        result[:hostAliases] = host_aliases.map(&:serialize)
        result[:imagePullSecrets] = image_pull_secrets.map(&:serialize)
        result[:initContainers] = init_containers.map(&:serialize)
        result[:readinessGates] = readiness_gates.map(&:serialize)
        result[:tolerations] = tolerations.map(&:serialize)
        result[:topologySpreadConstraints] = topology_spread_constraints.map(&:serialize)
        result[:volumes] = volumes.map(&:serialize)
        result[:affinity] = affinity.serialize
        result[:dnsConfig] = dns_config.serialize
        result[:securityContext] = security_context.serialize
        result[:nodeSelector] = node_selector.serialize
        result[:overhead] = overhead.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_spec
    end
  end
end
