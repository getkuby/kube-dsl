module KubeDSL::DSL::Authentication::V1
  class TokenReviewSpec
    extend ::KubeDSL::ValueFields

    value_fields :token
    array_field :audience

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:token] = token
        result[:audiences] = audiences
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :token_review_spec
    end
  end
end
