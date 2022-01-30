# typed: true

module KubeDSL::DSL::Admissionregistration::V1
  class ValidatingWebhookConfigurationList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "ValidatingWebhookConfigurationList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :validating_webhook_configuration_list
    end
  end
end
