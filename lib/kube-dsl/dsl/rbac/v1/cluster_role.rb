# typed: true

module KubeDSL
  module DSL
    module Rbac
      module V1
        class ClusterRole < ::KubeDSL::DSLObject
          object_field(:aggregation_rule) { KubeDSL::DSL::Rbac::V1::AggregationRule.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          array_field(:rule) { KubeDSL::DSL::Rbac::V1::PolicyRule.new }

          validates :aggregation_rule, object: { kind_of: KubeDSL::DSL::Rbac::V1::AggregationRule }
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :rules, array: { kind_of: KubeDSL::DSL::Rbac::V1::PolicyRule }, presence: false

          def serialize
            {}.tap do |result|
              result[:aggregationRule] = aggregation_rule.serialize
              result[:apiVersion] = "rbac.authorization.k8s.io/v1"
              result[:kind] = "ClusterRole"
              result[:metadata] = metadata.serialize
              result[:rules] = rules.map(&:serialize)
            end
          end

          def kind_sym
            :cluster_role
          end
        end
      end
    end
  end
end