module KubeDSL::DSL::Admissionregistration::V1beta1
  class MutatingWebhookConfigurationList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Admissionregistration::V1beta1::MutatingWebhookConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1beta1"
        result[:kind] = "MutatingWebhookConfigurationList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :mutating_webhook_configuration_list
    end
  end
end
