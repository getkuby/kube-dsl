module KubeDSL::DSL::Admissionregistration::V1
  class ValidatingWebhookConfiguration
    extend ::KubeDSL::ValueFields

    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1"
        result[:kind] = "ValidatingWebhookConfiguration"
        result[:webhooks] = webhooks.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :validating_webhook_configuration
    end
  end
end
