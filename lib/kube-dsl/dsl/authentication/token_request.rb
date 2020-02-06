module KubeDSL::DSL::Authentication
  class TokenRequest
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authentication::TokenRequestSpec.new }
    object_field(:status) { KubeDSL::DSL::Authentication::TokenRequestStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authentication.k8s.io/v1"
        result[:kind] = "TokenRequest"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
