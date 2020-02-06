module KubeDSL::DSL::Apiextensions
  class CustomResourceConversion
    extend ::KubeDSL::ValueFields
    value_fields :strategy
    array_field :conversion_review_version
    object_field(:webhook_client_config) { KubeDSL::DSL::Apiextensions::WebhookClientConfig.new }

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
  end
end
