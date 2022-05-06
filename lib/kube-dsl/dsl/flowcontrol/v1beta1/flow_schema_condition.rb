# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class FlowSchemaCondition < ::KubeDSL::DSLObject
          value_field :last_transition_time
          value_field :message
          value_field :reason
          value_field :status
          value_field :type

          validates :last_transition_time, field: { format: :string }, presence: false
          validates :message, field: { format: :string }, presence: false
          validates :reason, field: { format: :string }, presence: false
          validates :status, field: { format: :string }, presence: false
          validates :type, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:lastTransitionTime] = last_transition_time
              result[:message] = message
              result[:reason] = reason
              result[:status] = status
              result[:type] = type
            end
          end

          def kind_sym
            :flow_schema_condition
          end
        end
      end
    end
  end
end