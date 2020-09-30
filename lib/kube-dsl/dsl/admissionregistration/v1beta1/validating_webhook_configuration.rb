module KubeDSL::DSL::Admissionregistration::V1beta1
  class ValidatingWebhookConfiguration < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::V1beta1::ValidatingWebhook.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :webhooks, array: { kind_of: KubeDSL::DSL::Admissionregistration::V1beta1::ValidatingWebhook }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1beta1"
        result[:kind] = "ValidatingWebhookConfiguration"
        result[:metadata] = metadata.serialize
        result[:webhooks] = webhooks.map(&:serialize)
      end
    end

    def kind_sym
      :validating_webhook_configuration
    end
  end
end
