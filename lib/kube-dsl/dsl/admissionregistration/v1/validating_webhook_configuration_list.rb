module KubeDSL::DSL::Admissionregistration::V1
  class ValidatingWebhookConfigurationList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1"
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
