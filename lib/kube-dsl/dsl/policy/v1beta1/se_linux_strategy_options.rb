# typed: true

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class SELinuxStrategyOptions < ::KubeDSL::DSLObject
          value_field :rule
          object_field(:se_linux_options) { KubeDSL::DSL::V1::SELinuxOptions.new }

          validates :rule, field: { format: :string }, presence: false
          validates :se_linux_options, object: { kind_of: KubeDSL::DSL::V1::SELinuxOptions }

          def serialize
            {}.tap do |result|
              result[:rule] = rule
              result[:seLinuxOptions] = se_linux_options.serialize
            end
          end

          def kind_sym
            :se_linux_strategy_options
          end
        end
      end
    end
  end
end