module KubeDSL::DSL::Admissionregistration
  class ValidatingWebhookConfiguration
    extend ::KubeDSL::ValueFields

    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::ValidatingWebhook.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1beta1"
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
