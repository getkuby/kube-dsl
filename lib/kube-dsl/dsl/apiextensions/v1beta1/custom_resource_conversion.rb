module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceConversion
    extend ::KubeDSL::ValueFields

    value_fields :strategy
    array_field :conversion_review_version
    object_field(:webhook_client_config) { KubeDSL::DSL::Apiextensions::V1beta1::WebhookClientConfig.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:strategy] = strategy
        result[:conversionReviewVersions] = conversion_review_versions
        result[:webhookClientConfig] = webhook_client_config.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_conversion
    end
  end
end
