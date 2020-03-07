module KubeDSL::DSL::V1
  class WindowsSecurityContextOptions < ::KubeDSL::DSLObject
    value_fields :gmsa_credential_spec, :gmsa_credential_spec_name, :run_as_user_name

    def serialize
      {}.tap do |result|
        result[:gmsaCredentialSpec] = gmsa_credential_spec
        result[:gmsaCredentialSpecName] = gmsa_credential_spec_name
        result[:runAsUserName] = run_as_user_name
      end
    end

    def kind_sym
      :windows_security_context_options
    end
  end
end
