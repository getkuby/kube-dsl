module KubeDSL::DSL::Admissionregistration::V1beta1
  class MutatingWebhookConfigurationList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Admissionregistration::V1beta1::MutatingWebhookConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Admissionregistration::V1beta1::MutatingWebhookConfiguration }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1beta1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "MutatingWebhookConfigurationList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :mutating_webhook_configuration_list
    end
  end
end
