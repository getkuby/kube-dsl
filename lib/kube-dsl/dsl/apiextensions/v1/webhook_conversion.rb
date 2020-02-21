module KubeDSL::DSL::Apiextensions::V1
  class WebhookConversion
    extend ::KubeDSL::ValueFields

    array_field :conversion_review_version
    object_field(:client_config) { KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:conversionReviewVersions] = conversion_review_versions
        result[:clientConfig] = client_config.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :webhook_conversion
    end
  end
end
