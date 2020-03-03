module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceConversion < ::KubeDSL::DSLObject
    value_fields :strategy
    object_field(:webhook) { KubeDSL::DSL::Apiextensions::V1::WebhookConversion.new }

    def serialize
      {}.tap do |result|
        result[:strategy] = strategy
        result[:webhook] = webhook.serialize
      end
    end

    def kind
      :custom_resource_conversion
    end
  end
end
