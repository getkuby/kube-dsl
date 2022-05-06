# typed: strict

module KubeDSL
  module DSL
    module V1
      class VolumeProjection < ::KubeDSL::DSLObject
        object_field(:config_map) { KubeDSL::DSL::V1::ConfigMapProjection.new }
        object_field(:downward_api) { KubeDSL::DSL::V1::DownwardAPIProjection.new }
        object_field(:secret) { KubeDSL::DSL::V1::SecretProjection.new }
        object_field(:service_account_token) { KubeDSL::DSL::V1::ServiceAccountTokenProjection.new }

        validates :config_map, object: { kind_of: KubeDSL::DSL::V1::ConfigMapProjection }
        validates :downward_api, object: { kind_of: KubeDSL::DSL::V1::DownwardAPIProjection }
        validates :secret, object: { kind_of: KubeDSL::DSL::V1::SecretProjection }
        validates :service_account_token, object: { kind_of: KubeDSL::DSL::V1::ServiceAccountTokenProjection }

        def serialize
          {}.tap do |result|
            result[:configMap] = config_map.serialize
            result[:downwardAPI] = downward_api.serialize
            result[:secret] = secret.serialize
            result[:serviceAccountToken] = service_account_token.serialize
          end
        end

        def kind_sym
          :volume_projection
        end
      end
    end
  end
end