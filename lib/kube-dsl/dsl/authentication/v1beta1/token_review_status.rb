module KubeDSL::DSL::Authentication::V1beta1
  class TokenReviewStatus
    extend ::KubeDSL::ValueFields

    value_fields :authenticated, :error
    array_field :audience
    object_field(:user) { KubeDSL::DSL::Authentication::V1beta1::UserInfo.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:authenticated] = authenticated
        result[:error] = error
        result[:audiences] = audiences
        result[:user] = user.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :token_review_status
    end
  end
end
