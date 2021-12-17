module KubeDSL::DSL::V1
  class PodSecurityContext < ::KubeDSL::DSLObject
    value_field :fs_group
    value_field :fs_group_change_policy
    value_field :run_as_group
    value_field :run_as_non_root
    value_field :run_as_user
    object_field(:se_linux_options) { KubeDSL::DSL::V1::SELinuxOptions.new }
    object_field(:seccomp_profile) { KubeDSL::DSL::V1::SeccompProfile.new }
    value_field :supplemental_groups
    array_field(:sysctls) { KubeDSL::DSL::V1::Sysctl.new }
    object_field(:windows_options) { KubeDSL::DSL::V1::WindowsSecurityContextOptions.new }

    validates :fs_group, field: { format: :integer }, presence: false
    validates :fs_group_change_policy, field: { format: :string }, presence: false
    validates :run_as_group, field: { format: :integer }, presence: false
    validates :run_as_non_root, field: { format: :boolean }, presence: false
    validates :run_as_user, field: { format: :integer }, presence: false
    validates :se_linux_options, object: { kind_of: KubeDSL::DSL::V1::SELinuxOptions }
    validates :seccomp_profile, object: { kind_of: KubeDSL::DSL::V1::SeccompProfile }
    validates :supplemental_groups, field: { format: :string }, presence: false
    validates :sysctlses, array: { kind_of: KubeDSL::DSL::V1::Sysctl }, presence: false
    validates :windows_options, object: { kind_of: KubeDSL::DSL::V1::WindowsSecurityContextOptions }

    def serialize
      {}.tap do |result|
        result[:fsGroup] = fs_group
        result[:fsGroupChangePolicy] = fs_group_change_policy
        result[:runAsGroup] = run_as_group
        result[:runAsNonRoot] = run_as_non_root
        result[:runAsUser] = run_as_user
        result[:seLinuxOptions] = se_linux_options.serialize
        result[:seccompProfile] = seccomp_profile.serialize
        result[:supplementalGroups] = supplemental_groups
        result[:sysctls] = sysctlses.map(&:serialize)
        result[:windowsOptions] = windows_options.serialize
      end
    end

    def kind_sym
      :pod_security_context
    end
  end
end
