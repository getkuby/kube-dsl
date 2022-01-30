# typed: true

module KubeDSL::DSL::Auditregistration::V1alpha1
  class Webhook < ::KubeDSL::DSLObject
    object_field(:client_config) { KubeDSL::DSL::Auditregistration::V1alpha1::WebhookClientConfig.new }
    object_field(:throttle) { KubeDSL::DSL::Auditregistration::V1alpha1::WebhookThrottleConfig.new }

    validates :client_config, object: { kind_of: KubeDSL::DSL::Auditregistration::V1alpha1::WebhookClientConfig }
    validates :throttle, object: { kind_of: KubeDSL::DSL::Auditregistration::V1alpha1::WebhookThrottleConfig }

    def serialize
      {}.tap do |result|
        result[:clientConfig] = client_config.serialize
        result[:throttle] = throttle.serialize
      end
    end

    def kind_sym
      :webhook
    end
  end
end
