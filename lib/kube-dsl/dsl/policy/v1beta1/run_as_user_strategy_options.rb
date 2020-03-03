module KubeDSL::DSL::Policy::V1beta1
  class RunAsUserStrategyOptions < ::KubeDSL::DSLObject
    value_fields :rule
    array_field(:range) { KubeDSL::DSL::Policy::V1beta1::IDRange.new }

    def serialize
      {}.tap do |result|
        result[:rule] = rule
        result[:ranges] = ranges.map(&:serialize)
      end
    end

    def kind
      :run_as_user_strategy_options
    end
  end
end
