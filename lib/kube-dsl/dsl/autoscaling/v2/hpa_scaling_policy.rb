# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class HPAScalingPolicy < ::KubeDSL::DSLObject
          value_field :period_seconds
          value_field :type
          value_field :value

          validates :period_seconds, field: { format: :integer }, presence: false
          validates :type, field: { format: :string }, presence: false
          validates :value, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:periodSeconds] = period_seconds
              result[:type] = type
              result[:value] = value
            end
          end

          def kind_sym
            :hpa_scaling_policy
          end
        end
      end
    end
  end
end