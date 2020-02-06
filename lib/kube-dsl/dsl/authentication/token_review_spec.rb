module KubeDSL::DSL::Authentication
  class TokenReviewSpec
    extend ::KubeDSL::ValueFields
    value_fields :token
    array_field :audience

    def serialize
      {}.tap do |result|
        result[:token] = token
        result[:audiences] = audiences
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
