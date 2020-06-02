module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceConversion < ::KubeDSL::DSLObject
    value_fields :conversion_review_versions, :strategy
    object_field(:webhook_client_config) { KubeDSL::DSL::Apiextensions::V1beta1::WebhookClientConfig.new }

    def serialize
      {}.tap do |result|
        result[:conversionReviewVersions] = conversion_review_versions
        result[:strategy] = strategy
        result[:webhookClientConfig] = webhook_client_config.serialize
      end
    end

    def kind_sym
      :custom_resource_conversion
    end
  end
end
