module KubeDSL::DSL::Policy::V1beta1
  class PodSecurityPolicySpec < ::KubeDSL::DSLObject
    value_fields :allow_privilege_escalation, :allowed_capabilities, :allowed_proc_mount_types, :allowed_unsafe_sysctls, :default_add_capabilities, :default_allow_privilege_escalation, :forbidden_sysctls, :host_ipc, :host_network, :host_pid, :privileged, :read_only_root_filesystem, :required_drop_capabilities, :volumes
    array_field(:allowed_csi_driver) { KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver.new }
    array_field(:allowed_flex_volume) { KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume.new }
    array_field(:allowed_host_path) { KubeDSL::DSL::Policy::V1beta1::AllowedHostPath.new }
    array_field(:host_port) { KubeDSL::DSL::Policy::V1beta1::HostPortRange.new }
    object_field(:fs_group) { KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions.new }
    object_field(:run_as_group) { KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions.new }
    object_field(:run_as_user) { KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions.new }
    object_field(:runtime_class) { KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions.new }
    object_field(:se_linux) { KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions.new }
    object_field(:supplemental_groups) { KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions.new }

    def serialize
      {}.tap do |result|
        result[:allowPrivilegeEscalation] = allow_privilege_escalation
        result[:allowedCapabilities] = allowed_capabilities
        result[:allowedProcMountTypes] = allowed_proc_mount_types
        result[:allowedUnsafeSysctls] = allowed_unsafe_sysctls
        result[:defaultAddCapabilities] = default_add_capabilities
        result[:defaultAllowPrivilegeEscalation] = default_allow_privilege_escalation
        result[:forbiddenSysctls] = forbidden_sysctls
        result[:hostIPC] = host_ipc
        result[:hostNetwork] = host_network
        result[:hostPID] = host_pid
        result[:privileged] = privileged
        result[:readOnlyRootFilesystem] = read_only_root_filesystem
        result[:requiredDropCapabilities] = required_drop_capabilities
        result[:volumes] = volumes
        result[:allowedCSIDrivers] = allowed_csi_drivers.map(&:serialize)
        result[:allowedFlexVolumes] = allowed_flex_volumes.map(&:serialize)
        result[:allowedHostPaths] = allowed_host_paths.map(&:serialize)
        result[:hostPorts] = host_ports.map(&:serialize)
        result[:fsGroup] = fs_group.serialize
        result[:runAsGroup] = run_as_group.serialize
        result[:runAsUser] = run_as_user.serialize
        result[:runtimeClass] = runtime_class.serialize
        result[:seLinux] = se_linux.serialize
        result[:supplementalGroups] = supplemental_groups.serialize
      end
    end

    def kind_sym
      :pod_security_policy_spec
    end
  end
end
