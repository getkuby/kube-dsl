module KubeDSL::DSL::Flowcontrol::V1alpha1
  class LimitedPriorityLevelConfiguration
    extend ::KubeDSL::ValueFields

    value_fields :assured_concurrency_shares
    object_field(:limit_response) { KubeDSL::DSL::Flowcontrol::V1alpha1::LimitResponse.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:assuredConcurrencyShares] = assured_concurrency_shares
        result[:limitResponse] = limit_response.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :limited_priority_level_configuration
    end
  end
end
