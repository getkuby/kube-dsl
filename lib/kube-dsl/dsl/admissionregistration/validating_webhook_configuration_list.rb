module KubeDSL::DSL::Admissionregistration
  class ValidatingWebhookConfigurationList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Admissionregistration::ValidatingWebhookConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1beta1"
        result[:kind] = "ValidatingWebhookConfigurationList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :validating_webhook_configuration_list
    end
  end
end
