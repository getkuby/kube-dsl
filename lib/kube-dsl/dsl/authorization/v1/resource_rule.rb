# typed: strict

module KubeDSL
  module DSL
    module Authorization
      module V1
        class ResourceRule < ::KubeDSL::DSLObject
          value_field :api_groups
          value_field :resource_names
          value_field :resources
          value_field :verbs

          validates :api_groups, field: { format: :string }, presence: false
          validates :resource_names, field: { format: :string }, presence: false
          validates :resources, field: { format: :string }, presence: false
          validates :verbs, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiGroups] = api_groups
              result[:resourceNames] = resource_names
              result[:resources] = resources
              result[:verbs] = verbs
            end
          end

          def kind_sym
            :resource_rule
          end
        end
      end
    end
  end
end