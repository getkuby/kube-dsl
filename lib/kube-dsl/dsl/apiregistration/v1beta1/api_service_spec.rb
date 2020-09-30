module KubeDSL::DSL::Apiregistration::V1beta1
  class APIServiceSpec < ::KubeDSL::DSLObject
    value_field :ca_bundle
    value_field :group
    value_field :group_priority_minimum
    value_field :insecure_skip_tls_verify
    object_field(:service) { KubeDSL::DSL::Apiregistration::V1beta1::ServiceReference.new }
    value_field :version
    value_field :version_priority

    validates :ca_bundle, field: { format: :string }, presence: false
    validates :group, field: { format: :string }, presence: false
    validates :group_priority_minimum, field: { format: :integer }, presence: false
    validates :insecure_skip_tls_verify, field: { format: :boolean }, presence: false
    validates :service, object: { kind_of: KubeDSL::DSL::Apiregistration::V1beta1::ServiceReference }
    validates :version, field: { format: :string }, presence: false
    validates :version_priority, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:group] = group
        result[:groupPriorityMinimum] = group_priority_minimum
        result[:insecureSkipTLSVerify] = insecure_skip_tls_verify
        result[:service] = service.serialize
        result[:version] = version
        result[:versionPriority] = version_priority
      end
    end

    def kind_sym
      :api_service_spec
    end
  end
end
