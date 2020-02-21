module KubeDSL::DSL::Auditregistration::V1alpha1
  class Webhook
    extend ::KubeDSL::ValueFields

    object_field(:client_config) { KubeDSL::DSL::Auditregistration::V1alpha1::WebhookClientConfig.new }
    object_field(:throttle) { KubeDSL::DSL::Auditregistration::V1alpha1::WebhookThrottleConfig.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:clientConfig] = client_config.serialize
        result[:throttle] = throttle.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :webhook
    end
  end
end
