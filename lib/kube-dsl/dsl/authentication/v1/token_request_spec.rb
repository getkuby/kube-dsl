module KubeDSL::DSL::Authentication::V1
  class TokenRequestSpec
    extend ::KubeDSL::ValueFields

    value_fields :expiration_seconds
    array_field :audience
    object_field(:bound_object_ref) { KubeDSL::DSL::Authentication::V1::BoundObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:expirationSeconds] = expiration_seconds
        result[:audiences] = audiences
        result[:boundObjectRef] = bound_object_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :token_request_spec
    end
  end
end
