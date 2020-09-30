module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceConversion < ::KubeDSL::DSLObject
    value_field :strategy
    object_field(:webhook) { KubeDSL::DSL::Apiextensions::V1::WebhookConversion.new }

    validates :strategy, field: { format: :string }, presence: false
    validates :webhook, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::WebhookConversion }

    def serialize
      {}.tap do |result|
        result[:strategy] = strategy
        result[:webhook] = webhook.serialize
      end
    end

    def kind_sym
      :custom_resource_conversion
    end
  end
end
