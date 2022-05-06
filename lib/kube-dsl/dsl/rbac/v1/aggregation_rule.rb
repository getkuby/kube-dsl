# typed: strict

module KubeDSL
  module DSL
    module Rbac
      module V1
        class AggregationRule < ::KubeDSL::DSLObject
          array_field(:cluster_role_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

          validates :cluster_role_selectors, array: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }, presence: false

          def serialize
            {}.tap do |result|
              result[:clusterRoleSelectors] = cluster_role_selectors.map(&:serialize)
            end
          end

          def kind_sym
            :aggregation_rule
          end
        end
      end
    end
  end
end