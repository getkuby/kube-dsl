module KubeDSL::DSL::Apiextensions::V1
  class WebhookClientConfig
    extend ::KubeDSL::ValueFields

    value_fields :ca_bundle, :url
    object_field(:service) { KubeDSL::DSL::Apiextensions::V1::ServiceReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
