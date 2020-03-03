module KubeDSL::DSL::Auditregistration::V1alpha1
  class WebhookClientConfig < ::KubeDSL::DSLObject
    value_fields :ca_bundle, :url
    object_field(:service) { KubeDSL::DSL::Auditregistration::V1alpha1::ServiceReference.new }

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:url] = url
        result[:service] = service.serialize
      end
    end

    def kind
      :webhook_client_config
    end
  end
end
