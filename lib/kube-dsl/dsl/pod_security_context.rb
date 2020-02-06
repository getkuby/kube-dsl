module KubeDSL::DSL
  class PodSecurityContext
    extend ::KubeDSL::ValueFields
    value_fields :fs_group, :run_as_group, :run_as_non_root, :run_as_user
    array_field :supplemental_group
    array_field(:sysctl) { KubeDSL::DSL::Sysctl.new }
    object_field(:se_linux_options) { KubeDSL::DSL::SELinuxOptions.new }
    object_field(:windows_options) { KubeDSL::DSL::WindowsSecurityContextOptions.new }

    def serialize
      {}.tap do |result|
        result[:fsGroup] = fs_group
        result[:runAsGroup] = run_as_group
        result[:runAsNonRoot] = run_as_non_root
        result[:runAsUser] = run_as_user
        result[:supplementalGroups] = supplemental_groups
        result[:sysctls] = sysctls.map(&:serialize)
        result[:seLinuxOptions] = se_linux_options.serialize
        result[:windowsOptions] = windows_options.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
