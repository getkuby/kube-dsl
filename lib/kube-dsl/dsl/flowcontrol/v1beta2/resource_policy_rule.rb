# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class ResourcePolicyRule < ::KubeDSL::DSLObject
          value_field :api_groups
          value_field :cluster_scope
          value_field :namespaces
          value_field :resources
          value_field :verbs

          validates :api_groups, field: { format: :string }, presence: false
          validates :cluster_scope, field: { format: :boolean }, presence: false
          validates :namespaces, field: { format: :string }, presence: false
          validates :resources, field: { format: :string }, presence: false
          validates :verbs, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiGroups] = api_groups
              result[:clusterScope] = cluster_scope
              result[:namespaces] = namespaces
              result[:resources] = resources
              result[:verbs] = verbs
            end
          end

          def kind_sym
            :resource_policy_rule
          end
        end
      end
    end
  end
end