module KubeDSL::DSL::Extensions::V1beta1
  class FSGroupStrategyOptions
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
      :fs_group_strategy_options
    end
  end
end
