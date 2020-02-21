module KubeDSL::DSL::Admissionregistration::V1
  class MutatingWebhookConfigurationList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "admissionregistration.k8s.io/v1"
        result[:kind] = "MutatingWebhookConfigurationList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :mutating_webhook_configuration_list
    end
  end
end
