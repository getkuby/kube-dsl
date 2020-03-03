module KubeDSL::DSL::Admissionregistration::V1
  class MutatingWebhookConfiguration < ::KubeDSL::DSLObject
    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::V1::MutatingWebhook.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1"
        result[:kind] = "MutatingWebhookConfiguration"
        result[:webhooks] = webhooks.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :mutating_webhook_configuration
    end
  end
end
