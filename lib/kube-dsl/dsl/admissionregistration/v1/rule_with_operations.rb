module KubeDSL::DSL::Admissionregistration::V1
  class RuleWithOperations < ::KubeDSL::DSLObject
    value_fields :scope
    array_field :api_group
    array_field :api_version
    array_field :operation
    array_field :resource

    def serialize
      {}.tap do |result|
        result[:scope] = scope
        result[:apiGroups] = api_groups
        result[:apiVersions] = api_versions
        result[:operations] = operations
        result[:resources] = resources
      end
    end

    def kind
      :rule_with_operations
    end
  end
end
