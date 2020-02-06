module KubeDSL::DSL
  class WindowsSecurityContextOptions
    extend ::KubeDSL::ValueFields
    value_fields :gmsa_credential_spec, :gmsa_credential_spec_name, :run_as_user_name

    def serialize
      {}.tap do |result|
        result[:gmsaCredentialSpec] = gmsa_credential_spec
        result[:gmsaCredentialSpecName] = gmsa_credential_spec_name
        result[:runAsUserName] = run_as_user_name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
