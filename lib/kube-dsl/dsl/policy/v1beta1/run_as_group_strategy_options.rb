# typed: true

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class RunAsGroupStrategyOptions < ::KubeDSL::DSLObject
          array_field(:range) { KubeDSL::DSL::Policy::V1beta1::IDRange.new }
          value_field :rule

          validates :ranges, array: { kind_of: KubeDSL::DSL::Policy::V1beta1::IDRange }, presence: false
          validates :rule, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:ranges] = ranges.map(&:serialize)
              result[:rule] = rule
            end
          end

          def kind_sym
            :run_as_group_strategy_options
          end
        end
      end
    end
  end
end