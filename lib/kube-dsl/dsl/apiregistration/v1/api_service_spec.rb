module KubeDSL::DSL::Apiregistration::V1
  class APIServiceSpec
    extend ::KubeDSL::ValueFields

    value_fields :ca_bundle, :group, :group_priority_minimum, :insecure_skip_tls_verify, :version, :version_priority
    object_field(:service) { KubeDSL::DSL::Apiregistration::V1::ServiceReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_service_spec
    end
  end
end
