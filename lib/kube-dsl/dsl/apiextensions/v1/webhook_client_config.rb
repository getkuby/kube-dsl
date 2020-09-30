module KubeDSL::DSL::Apiextensions::V1
  class WebhookClientConfig < ::KubeDSL::DSLObject
    value_field :ca_bundle
    object_field(:service) { KubeDSL::DSL::Apiextensions::V1::ServiceReference.new }
    value_field :url

    validates :ca_bundle, field: { format: :string }, presence: false
    validates :service, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::ServiceReference }
    validates :url, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:caBundle] = ca_bundle
        result[:service] = service.serialize
        result[:url] = url
      end
    end

    def kind_sym
      :webhook_client_config
    end
  end
end
