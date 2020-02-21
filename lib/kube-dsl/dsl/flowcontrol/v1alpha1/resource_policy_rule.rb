module KubeDSL::DSL::Flowcontrol::V1alpha1
  class ResourcePolicyRule
    extend ::KubeDSL::ValueFields

    value_fields :cluster_scope
    array_field :api_group
    array_field :namespace
    array_field :resource
    array_field :verb

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:clusterScope] = cluster_scope
        result[:apiGroups] = api_groups
        result[:namespaces] = namespaces
        result[:resources] = resources
        result[:verbs] = verbs
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_policy_rule
    end
  end
end
