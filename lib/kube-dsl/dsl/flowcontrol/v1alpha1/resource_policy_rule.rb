module KubeDSL::DSL::Flowcontrol::V1alpha1
  class ResourcePolicyRule < ::KubeDSL::DSLObject
    value_fields :cluster_scope
    array_field :api_group
    array_field :namespace
    array_field :resource
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:clusterScope] = cluster_scope
        result[:apiGroups] = api_groups
        result[:namespaces] = namespaces
        result[:resources] = resources
        result[:verbs] = verbs
      end
    end

    def kind
      :resource_policy_rule
    end
  end
end
