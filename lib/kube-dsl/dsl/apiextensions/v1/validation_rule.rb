# typed: true

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class ValidationRule < ::KubeDSL::DSLObject
          value_field :message
          value_field :rule

          validates :message, field: { format: :string }, presence: false
          validates :rule, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:message] = message
              result[:rule] = rule
            end
          end

          def kind_sym
            :validation_rule
          end
        end
      end
    end
  end
end