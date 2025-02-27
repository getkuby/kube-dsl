# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class PriorityLevelConfigurationStatus < ::KubeDSL::DSLObject
          array_field(:condition) { KubeDSL::DSL::Flowcontrol::V1beta2::PriorityLevelConfigurationCondition.new }

          validates :conditions, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta2::PriorityLevelConfigurationCondition }, presence: false

          def serialize
            {}.tap do |result|
              result[:conditions] = conditions.map(&:serialize)
            end
          end

          def kind_sym
            :priority_level_configuration_status
          end
        end
      end
    end
  end
end