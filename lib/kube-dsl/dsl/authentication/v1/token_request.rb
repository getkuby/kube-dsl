module KubeDSL::DSL::Authentication::V1
  class TokenRequest
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authentication::V1::TokenRequestSpec.new }
    object_field(:status) { KubeDSL::DSL::Authentication::V1::TokenRequestStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :token_request
    end
  end
end
