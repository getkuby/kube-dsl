# typed: true

module KubeDSL::DSL::Policy::V1beta1
  class PodSecurityPolicySpec < ::KubeDSL::DSLObject
    value_field :allow_privilege_escalation
    array_field(:allowed_csi_driver) { KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver.new }
    value_field :allowed_capabilities
    array_field(:allowed_flex_volume) { KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume.new }
    array_field(:allowed_host_path) { KubeDSL::DSL::Policy::V1beta1::AllowedHostPath.new }
    value_field :allowed_proc_mount_types
    value_field :allowed_unsafe_sysctls
    value_field :default_add_capabilities
    value_field :default_allow_privilege_escalation
    value_field :forbidden_sysctls
    object_field(:fs_group) { KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions.new }
    value_field :host_ipc
    value_field :host_network
    value_field :host_pid
    array_field(:host_port) { KubeDSL::DSL::Policy::V1beta1::HostPortRange.new }
    value_field :privileged
    value_field :read_only_root_filesystem
    value_field :required_drop_capabilities
    object_field(:run_as_group) { KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions.new }
    object_field(:run_as_user) { KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions.new }
    object_field(:runtime_class) { KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions.new }
    object_field(:se_linux) { KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions.new }
    object_field(:supplemental_groups) { KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions.new }
    value_field :volumes

    validates :allow_privilege_escalation, field: { format: :boolean }, presence: false
    validates :allowed_csi_drivers, array: { kind_of: KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver }, presence: false
    validates :allowed_capabilities, field: { format: :string }, presence: false
    validates :allowed_flex_volumes, array: { kind_of: KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume }, presence: false
    validates :allowed_host_paths, array: { kind_of: KubeDSL::DSL::Policy::V1beta1::AllowedHostPath }, presence: false
    validates :allowed_proc_mount_types, field: { format: :string }, presence: false
    validates :allowed_unsafe_sysctls, field: { format: :string }, presence: false
    validates :default_add_capabilities, field: { format: :string }, presence: false
    validates :default_allow_privilege_escalation, field: { format: :boolean }, presence: false
    validates :forbidden_sysctls, field: { format: :string }, presence: false
    validates :fs_group, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions }
    validates :host_ipc, field: { format: :boolean }, presence: false
    validates :host_network, field: { format: :boolean }, presence: false
    validates :host_pid, field: { format: :boolean }, presence: false
    validates :host_ports, array: { kind_of: KubeDSL::DSL::Policy::V1beta1::HostPortRange }, presence: false
    validates :privileged, field: { format: :boolean }, presence: false
    validates :read_only_root_filesystem, field: { format: :boolean }, presence: false
    validates :required_drop_capabilities, field: { format: :string }, presence: false
    validates :run_as_group, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions }
    validates :run_as_user, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions }
    validates :runtime_class, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions }
    validates :se_linux, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions }
    validates :supplemental_groups, object: { kind_of: KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions }
    validates :volumes, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:allowPrivilegeEscalation] = allow_privilege_escalation
        result[:allowedCSIDrivers] = allowed_csi_drivers.map(&:serialize)
        result[:allowedCapabilities] = allowed_capabilities
        result[:allowedFlexVolumes] = allowed_flex_volumes.map(&:serialize)
        result[:allowedHostPaths] = allowed_host_paths.map(&:serialize)
        result[:allowedProcMountTypes] = allowed_proc_mount_types
        result[:allowedUnsafeSysctls] = allowed_unsafe_sysctls
        result[:defaultAddCapabilities] = default_add_capabilities
        result[:defaultAllowPrivilegeEscalation] = default_allow_privilege_escalation
        result[:forbiddenSysctls] = forbidden_sysctls
        result[:fsGroup] = fs_group.serialize
        result[:hostIPC] = host_ipc
        result[:hostNetwork] = host_network
        result[:hostPID] = host_pid
        result[:hostPorts] = host_ports.map(&:serialize)
        result[:privileged] = privileged
        result[:readOnlyRootFilesystem] = read_only_root_filesystem
        result[:requiredDropCapabilities] = required_drop_capabilities
        result[:runAsGroup] = run_as_group.serialize
        result[:runAsUser] = run_as_user.serialize
        result[:runtimeClass] = runtime_class.serialize
        result[:seLinux] = se_linux.serialize
        result[:supplementalGroups] = supplemental_groups.serialize
        result[:volumes] = volumes
      end
    end

    def kind_sym
      :pod_security_policy_spec
    end
  end
end
