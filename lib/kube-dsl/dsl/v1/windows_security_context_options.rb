# typed: strict

module KubeDSL
  module DSL
    module V1
      class WindowsSecurityContextOptions < ::KubeDSL::DSLObject
        value_field :gmsa_credential_spec
        value_field :gmsa_credential_spec_name
        value_field :host_process
        value_field :run_as_user_name

        validates :gmsa_credential_spec, field: { format: :string }, presence: false
        validates :gmsa_credential_spec_name, field: { format: :string }, presence: false
        validates :host_process, field: { format: :boolean }, presence: false
        validates :run_as_user_name, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:gmsaCredentialSpec] = gmsa_credential_spec
            result[:gmsaCredentialSpecName] = gmsa_credential_spec_name
            result[:hostProcess] = host_process
            result[:runAsUserName] = run_as_user_name
          end
        end

        def kind_sym
          :windows_security_context_options
        end
      end
    end
  end
end