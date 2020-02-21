module KubeDSL::DSL::Admissionregistration::V1beta1
  class MutatingWebhookConfiguration
    extend ::KubeDSL::ValueFields

    array_field(:webhook) { KubeDSL::DSL::Admissionregistration::V1beta1::MutatingWebhook.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
