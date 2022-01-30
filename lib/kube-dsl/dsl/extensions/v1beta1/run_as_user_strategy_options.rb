# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class RunAsUserStrategyOptions < ::KubeDSL::DSLObject
    array_field(:range) { KubeDSL::DSL::Extensions::V1beta1::IDRange.new }
    value_field :rule

    validates :ranges, array: { kind_of: KubeDSL::DSL::Extensions::V1beta1::IDRange }, presence: false
    validates :rule, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:ranges] = ranges.map(&:serialize)
        result[:rule] = rule
      end
    end

    def kind_sym
      :run_as_user_strategy_options
    end
  end
end
