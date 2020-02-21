module KubeDSL::DSL::Extensions::V1beta1
  class RunAsUserStrategyOptions
    extend ::KubeDSL::ValueFields

    value_fields :rule
    array_field(:range) { KubeDSL::DSL::Extensions::V1beta1::IDRange.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:rule] = rule
        result[:ranges] = ranges.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :run_as_user_strategy_options
    end
  end
end
