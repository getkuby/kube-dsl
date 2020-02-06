module KubeDSL::DSL::Auditregistration
  class Webhook
    extend ::KubeDSL::ValueFields
    object_field(:client_config) { KubeDSL::DSL::Auditregistration::WebhookClientConfig.new }
    object_field(:throttle) { KubeDSL::DSL::Auditregistration::WebhookThrottleConfig.new }

    def serialize
      {}.tap do |result|
        result[:clientConfig] = client_config.serialize
        result[:throttle] = throttle.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
