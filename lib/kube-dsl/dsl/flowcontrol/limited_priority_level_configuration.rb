module KubeDSL::DSL::Flowcontrol
  class LimitedPriorityLevelConfiguration
    extend ::KubeDSL::ValueFields
    value_fields :assured_concurrency_shares
    object_field(:limit_response) { KubeDSL::DSL::Flowcontrol::LimitResponse.new }

    def serialize
      {}.tap do |result|
        result[:assuredConcurrencyShares] = assured_concurrency_shares
        result[:limitResponse] = limit_response.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
