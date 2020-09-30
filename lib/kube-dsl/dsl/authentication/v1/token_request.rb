module KubeDSL::DSL::Authentication::V1
  class TokenRequest < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authentication::V1::TokenRequestSpec.new }
    object_field(:status) { KubeDSL::DSL::Authentication::V1::TokenRequestStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Authentication::V1::TokenRequestSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Authentication::V1::TokenRequestStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authentication.k8s.io/v1"
        result[:kind] = "TokenRequest"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :token_request
    end
  end
end
