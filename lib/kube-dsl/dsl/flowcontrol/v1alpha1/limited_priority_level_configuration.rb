module KubeDSL::DSL::Flowcontrol::V1alpha1
  class LimitedPriorityLevelConfiguration < ::KubeDSL::DSLObject
    value_fields :assured_concurrency_shares
    object_field(:limit_response) { KubeDSL::DSL::Flowcontrol::V1alpha1::LimitResponse.new }

    def serialize
      {}.tap do |result|
        result[:assuredConcurrencyShares] = assured_concurrency_shares
        result[:limitResponse] = limit_response.serialize
      end
    end

    def kind
      :limited_priority_level_configuration
    end
  end
end
