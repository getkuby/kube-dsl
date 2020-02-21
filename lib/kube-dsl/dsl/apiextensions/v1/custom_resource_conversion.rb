module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceConversion
    extend ::KubeDSL::ValueFields

    value_fields :strategy
    object_field(:webhook) { KubeDSL::DSL::Apiextensions::V1::WebhookConversion.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:strategy] = strategy
        result[:webhook] = webhook.serialize
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
