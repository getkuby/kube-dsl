# typed: true

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class WebhookConversion < ::KubeDSL::DSLObject
          object_field(:client_config) { KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig.new }
          value_field :conversion_review_versions

          validates :client_config, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig }
          validates :conversion_review_versions, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:clientConfig] = client_config.serialize
              result[:conversionReviewVersions] = conversion_review_versions
            end
          end

          def kind_sym
            :webhook_conversion
          end
        end
      end
    end
  end
end