module KubeDSL::DSL::Extensions
  class PodSecurityPolicySpec
    extend ::KubeDSL::ValueFields
    value_fields :allow_privilege_escalation, :default_allow_privilege_escalation, :host_ipc, :host_network, :host_pid, :privileged, :read_only_root_filesystem
    array_field(:allowed_csi_driver) { KubeDSL::DSL::Extensions::AllowedCSIDriver.new }
    array_field :allowed_capability
    array_field(:allowed_flex_volume) { KubeDSL::DSL::Extensions::AllowedFlexVolume.new }
    array_field(:allowed_host_path) { KubeDSL::DSL::Extensions::AllowedHostPath.new }
    array_field :allowed_proc_mount_type
    array_field :allowed_unsafe_sysctl
    array_field :default_add_capability
    array_field :forbidden_sysctl
    array_field(:host_port) { KubeDSL::DSL::Extensions::HostPortRange.new }
    array_field :required_drop_capability
    array_field :volume
    object_field(:fs_group) { KubeDSL::DSL::Extensions::FSGroupStrategyOptions.new }
    object_field(:run_as_group) { KubeDSL::DSL::Extensions::RunAsGroupStrategyOptions.new }
    object_field(:run_as_user) { KubeDSL::DSL::Extensions::RunAsUserStrategyOptions.new }
    object_field(:runtime_class) { KubeDSL::DSL::Extensions::RuntimeClassStrategyOptions.new }
    object_field(:se_linux) { KubeDSL::DSL::Extensions::SELinuxStrategyOptions.new }
    object_field(:supplemental_groups) { KubeDSL::DSL::Extensions::SupplementalGroupsStrategyOptions.new }

    def serialize
      {}.tap do |result|
        result[:allowPrivilegeEscalation] = allow_privilege_escalation
        result[:defaultAllowPrivilegeEscalation] = default_allow_privilege_escalation
        result[:hostIPC] = host_ipc
        result[:hostNetwork] = host_network
        result[:hostPID] = host_pid
        result[:privileged] = privileged
        result[:readOnlyRootFilesystem] = read_only_root_filesystem
        result[:allowedCSIDrivers] = allowed_csi_drivers.map(&:serialize)
        result[:allowedCapabilities] = allowed_capabilities
        result[:allowedFlexVolumes] = allowed_flex_volumes.map(&:serialize)
        result[:allowedHostPaths] = allowed_host_paths.map(&:serialize)
        result[:allowedProcMountTypes] = allowed_proc_mount_types
        result[:allowedUnsafeSysctls] = allowed_unsafe_sysctls
        result[:defaultAddCapabilities] = default_add_capabilities
        result[:forbiddenSysctls] = forbidden_sysctls
        result[:hostPorts] = host_ports.map(&:serialize)
        result[:requiredDropCapabilities] = required_drop_capabilities
        result[:volumes] = volumes
        result[:fsGroup] = fs_group.serialize
        result[:runAsGroup] = run_as_group.serialize
        result[:runAsUser] = run_as_user.serialize
        result[:runtimeClass] = runtime_class.serialize
        result[:seLinux] = se_linux.serialize
        result[:supplementalGroups] = supplemental_groups.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
