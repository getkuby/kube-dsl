module KubeDSL::DSL::Admissionregistration::V1
  class ValidatingWebhookConfiguration < ::KubeDSL::DSLObject
    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1"
        result[:kind] = "ValidatingWebhookConfiguration"
        result[:webhooks] = webhooks.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :validating_webhook_configuration
    end
  end
end
