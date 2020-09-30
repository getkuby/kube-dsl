module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceConversion < ::KubeDSL::DSLObject
    value_field :conversion_review_versions
    value_field :strategy
    object_field(:webhook_client_config) { KubeDSL::DSL::Apiextensions::V1beta1::WebhookClientConfig.new }

    validates :conversion_review_versions, field: { format: :string }, presence: false
    validates :strategy, field: { format: :string }, presence: false
    validates :webhook_client_config, object: { kind_of: KubeDSL::DSL::Apiextensions::V1beta1::WebhookClientConfig }

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
