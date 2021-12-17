module KubeDSL::DSL::V1
  class SecurityContext < ::KubeDSL::DSLObject
    value_field :allow_privilege_escalation
    object_field(:capabilities) { KubeDSL::DSL::V1::Capabilities.new }
    value_field :privileged
    value_field :proc_mount
    value_field :read_only_root_filesystem
    value_field :run_as_group
    value_field :run_as_non_root
    value_field :run_as_user
    object_field(:se_linux_options) { KubeDSL::DSL::V1::SELinuxOptions.new }
    object_field(:seccomp_profile) { KubeDSL::DSL::V1::SeccompProfile.new }
    object_field(:windows_options) { KubeDSL::DSL::V1::WindowsSecurityContextOptions.new }

    validates :allow_privilege_escalation, field: { format: :boolean }, presence: false
    validates :capabilities, object: { kind_of: KubeDSL::DSL::V1::Capabilities }
    validates :privileged, field: { format: :boolean }, presence: false
    validates :proc_mount, field: { format: :string }, presence: false
    validates :read_only_root_filesystem, field: { format: :boolean }, presence: false
    validates :run_as_group, field: { format: :integer }, presence: false
    validates :run_as_non_root, field: { format: :boolean }, presence: false
    validates :run_as_user, field: { format: :integer }, presence: false
    validates :se_linux_options, object: { kind_of: KubeDSL::DSL::V1::SELinuxOptions }
    validates :seccomp_profile, object: { kind_of: KubeDSL::DSL::V1::SeccompProfile }
    validates :windows_options, object: { kind_of: KubeDSL::DSL::V1::WindowsSecurityContextOptions }

    def serialize
      {}.tap do |result|
        result[:allowPrivilegeEscalation] = allow_privilege_escalation
        result[:capabilities] = capabilities.serialize
        result[:privileged] = privileged
        result[:procMount] = proc_mount
        result[:readOnlyRootFilesystem] = read_only_root_filesystem
        result[:runAsGroup] = run_as_group
        result[:runAsNonRoot] = run_as_non_root
        result[:runAsUser] = run_as_user
        result[:seLinuxOptions] = se_linux_options.serialize
        result[:seccompProfile] = seccomp_profile.serialize
        result[:windowsOptions] = windows_options.serialize
      end
    end

    def kind_sym
      :security_context
    end
  end
end
