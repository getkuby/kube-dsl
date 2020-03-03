module KubeDSL::DSL::Auditregistration::V1alpha1
  class Webhook < ::KubeDSL::DSLObject
    object_field(:client_config) { KubeDSL::DSL::Auditregistration::V1alpha1::WebhookClientConfig.new }
    object_field(:throttle) { KubeDSL::DSL::Auditregistration::V1alpha1::WebhookThrottleConfig.new }

    def serialize
      {}.tap do |result|
        result[:clientConfig] = client_config.serialize
        result[:throttle] = throttle.serialize
      end
    end

    def kind
      :webhook
    end
  end
end
