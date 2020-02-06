module KubeDSL::DSL::Auditregistration
  class WebhookClientConfig
    extend ::KubeDSL::ValueFields

    value_fields :ca_bundle, :url
    object_field(:service) { KubeDSL::DSL::Auditregistration::ServiceReference.new }

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:url] = url
        result[:service] = service.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :webhook_client_config
    end
  end
end
