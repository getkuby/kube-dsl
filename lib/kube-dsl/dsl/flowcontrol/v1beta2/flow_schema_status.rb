# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class FlowSchemaStatus < ::KubeDSL::DSLObject
          array_field(:condition) { KubeDSL::DSL::Flowcontrol::V1beta2::FlowSchemaCondition.new }

          validates :conditions, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta2::FlowSchemaCondition }, presence: false

          def serialize
            {}.tap do |result|
              result[:conditions] = conditions.map(&:serialize)
            end
          end

          def kind_sym
            :flow_schema_status
          end
        end
      end
    end
  end
end