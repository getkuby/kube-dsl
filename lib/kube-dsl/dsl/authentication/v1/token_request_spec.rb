module KubeDSL::DSL::Authentication::V1
  class TokenRequestSpec < ::KubeDSL::DSLObject
    value_field :audiences
    object_field(:bound_object_ref) { KubeDSL::DSL::Authentication::V1::BoundObjectReference.new }
    value_field :expiration_seconds

    validates :audiences, field: { format: :string }, presence: false
    validates :bound_object_ref, object: { kind_of: KubeDSL::DSL::Authentication::V1::BoundObjectReference }
    validates :expiration_seconds, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:audiences] = audiences
        result[:boundObjectRef] = bound_object_ref.serialize
        result[:expirationSeconds] = expiration_seconds
      end
    end

    def kind_sym
      :token_request_spec
    end
  end
end
