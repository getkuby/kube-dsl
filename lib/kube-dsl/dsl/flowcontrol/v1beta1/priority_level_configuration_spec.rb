# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class PriorityLevelConfigurationSpec < ::KubeDSL::DSLObject
          object_field(:limited) { KubeDSL::DSL::Flowcontrol::V1beta1::LimitedPriorityLevelConfiguration.new }
          value_field :type

          validates :limited, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::LimitedPriorityLevelConfiguration }
          validates :type, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:limited] = limited.serialize
              result[:type] = type
            end
          end

          def kind_sym
            :priority_level_configuration_spec
          end
        end
      end
    end
  end
end