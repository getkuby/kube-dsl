module KubeDSL::DSL
  class VolumeProjection
    extend ::KubeDSL::ValueFields

    object_field(:config_map) { KubeDSL::DSL::ConfigMapProjection.new }
    object_field(:downward_api) { KubeDSL::DSL::DownwardAPIProjection.new }
    object_field(:secret) { KubeDSL::DSL::SecretProjection.new }
    object_field(:service_account_token) { KubeDSL::DSL::ServiceAccountTokenProjection.new }

    def serialize
      {}.tap do |result|
        result[:configMap] = config_map.serialize
        result[:downwardAPI] = downward_api.serialize
        result[:secret] = secret.serialize
        result[:serviceAccountToken] = service_account_token.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_projection
    end
  end
end
