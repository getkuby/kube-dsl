module KubeDSL::DSL::V1
  class PodSecurityContext < ::KubeDSL::DSLObject
    value_fields :fs_group, :run_as_group, :run_as_non_root, :run_as_user
    array_field :supplemental_group
    array_field(:sysctls) { KubeDSL::DSL::V1::Sysctl.new }
    object_field(:se_linux_options) { KubeDSL::DSL::V1::SELinuxOptions.new }
    object_field(:windows_options) { KubeDSL::DSL::V1::WindowsSecurityContextOptions.new }

    def serialize
      {}.tap do |result|
        result[:fsGroup] = fs_group
        result[:runAsGroup] = run_as_group
        result[:runAsNonRoot] = run_as_non_root
        result[:runAsUser] = run_as_user
        result[:supplementalGroups] = supplemental_groups
        result[:sysctls] = sysctlses.map(&:serialize)
        result[:seLinuxOptions] = se_linux_options.serialize
        result[:windowsOptions] = windows_options.serialize
      end
    end

    def kind
      :pod_security_context
    end
  end
end
