module KubeDSL::DSL::Flowcontrol::V1alpha1
  class ResourcePolicyRule < ::KubeDSL::DSLObject
    value_fields :api_groups, :cluster_scope, :namespaces, :resources, :verbs

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
