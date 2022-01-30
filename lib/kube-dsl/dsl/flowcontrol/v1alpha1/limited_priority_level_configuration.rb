# typed: true

module KubeDSL::DSL::Flowcontrol::V1alpha1
  class LimitedPriorityLevelConfiguration < ::KubeDSL::DSLObject
    value_field :assured_concurrency_shares
    object_field(:limit_response) { KubeDSL::DSL::Flowcontrol::V1alpha1::LimitResponse.new }

    validates :assured_concurrency_shares, field: { format: :integer }, presence: false
    validates :limit_response, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::LimitResponse }

    def serialize
      {}.tap do |result|
        result[:assuredConcurrencyShares] = assured_concurrency_shares
        result[:limitResponse] = limit_response.serialize
      end
    end

    def kind_sym
      :limited_priority_level_configuration
    end
  end
end
