module KubeDSL::DSL::Admissionregistration::V1beta1
  class RuleWithOperations < ::KubeDSL::DSLObject
    value_fields :api_groups, :api_versions, :operations, :resources, :scope

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
