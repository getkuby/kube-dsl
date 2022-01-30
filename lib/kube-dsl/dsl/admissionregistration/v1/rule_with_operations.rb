# typed: true

module KubeDSL::DSL::Admissionregistration::V1
  class RuleWithOperations < ::KubeDSL::DSLObject
    value_field :api_groups
    value_field :api_versions
    value_field :operations
    value_field :resources
    value_field :scope

    validates :api_groups, field: { format: :string }, presence: false
    validates :api_versions, field: { format: :string }, presence: false
    validates :operations, field: { format: :string }, presence: false
    validates :resources, field: { format: :string }, presence: false
    validates :scope, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiGroups] = api_groups
        result[:apiVersions] = api_versions
        result[:operations] = operations
        result[:resources] = resources
        result[:scope] = scope
      end
    end

    def kind_sym
      :rule_with_operations
    end
  end
end
