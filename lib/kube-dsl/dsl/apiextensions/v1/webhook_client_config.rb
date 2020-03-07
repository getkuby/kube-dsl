module KubeDSL::DSL::Apiextensions::V1
  class WebhookClientConfig < ::KubeDSL::DSLObject
    value_fields :ca_bundle, :url
    object_field(:service) { KubeDSL::DSL::Apiextensions::V1::ServiceReference.new }

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:url] = url
        result[:service] = service.serialize
      end
    end

    def kind_sym
      :webhook_client_config
    end
  end
end
