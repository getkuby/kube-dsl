module KubeDSL::DSL::Rbac::V1beta1
  class PolicyRule < ::KubeDSL::DSLObject
    value_fields :api_groups, :non_resource_ur_ls, :resource_names, :resources, :verbs

    def serialize
      {}.tap do |result|
        result[:apiGroups] = api_groups
        result[:nonResourceURLs] = non_resource_ur_ls
        result[:resourceNames] = resource_names
        result[:resources] = resources
        result[:verbs] = verbs
      end
    end

    def kind_sym
      :policy_rule
    end
  end
end
