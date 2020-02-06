module KubeDSL::DSL::Admissionregistration
  class MutatingWebhookConfiguration
    extend ::KubeDSL::ValueFields

    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::MutatingWebhook.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1beta1"
        result[:kind] = "MutatingWebhookConfiguration"
        result[:webhooks] = webhooks.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :mutating_webhook_configuration
    end
  end
end
