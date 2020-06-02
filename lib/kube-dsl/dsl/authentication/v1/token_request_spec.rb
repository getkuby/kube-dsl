module KubeDSL::DSL::Authentication::V1
  class TokenRequestSpec < ::KubeDSL::DSLObject
    value_fields :audiences, :expiration_seconds
    object_field(:bound_object_ref) { KubeDSL::DSL::Authentication::V1::BoundObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:audiences] = audiences
        result[:expirationSeconds] = expiration_seconds
        result[:boundObjectRef] = bound_object_ref.serialize
      end
    end

    def kind_sym
      :token_request_spec
    end
  end
end
