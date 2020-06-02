module KubeDSL::DSL::Apiextensions::V1
  class WebhookConversion < ::KubeDSL::DSLObject
    value_fields :conversion_review_versions
    object_field(:client_config) { KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig.new }

    def serialize
      {}.tap do |result|
        result[:conversionReviewVersions] = conversion_review_versions
        result[:clientConfig] = client_config.serialize
      end
    end

    def kind_sym
      :webhook_conversion
    end
  end
end
