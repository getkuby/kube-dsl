module KubeDSL::DSL::Apiregistration::V1
  class APIServiceSpec < ::KubeDSL::DSLObject
    value_fields :ca_bundle, :group, :group_priority_minimum, :insecure_skip_tls_verify, :version, :version_priority
    object_field(:service) { KubeDSL::DSL::Apiregistration::V1::ServiceReference.new }

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:group] = group
        result[:groupPriorityMinimum] = group_priority_minimum
        result[:insecureSkipTLSVerify] = insecure_skip_tls_verify
        result[:version] = version
        result[:versionPriority] = version_priority
        result[:service] = service.serialize
      end
    end

    def kind_sym
      :api_service_spec
    end
  end
end
