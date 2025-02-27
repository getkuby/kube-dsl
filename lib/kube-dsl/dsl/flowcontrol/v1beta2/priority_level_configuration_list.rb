# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class PriorityLevelConfigurationList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Flowcontrol::V1beta2::PriorityLevelConfiguration.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta2::PriorityLevelConfiguration }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1beta2"
              result[:items] = items.map(&:serialize)
              result[:kind] = "PriorityLevelConfigurationList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :priority_level_configuration_list
          end
        end
      end
    end
  end
end