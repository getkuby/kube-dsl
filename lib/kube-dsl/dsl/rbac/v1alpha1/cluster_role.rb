module KubeDSL::DSL::Rbac::V1alpha1
  class ClusterRole
    extend ::KubeDSL::ValueFields

    array_field(:rule) { KubeDSL::DSL::Rbac::V1alpha1::PolicyRule.new }
    object_field(:aggregation_rule) { KubeDSL::DSL::Rbac::V1alpha1::AggregationRule.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1alpha1"
        result[:kind] = "ClusterRole"
        result[:rules] = rules.map(&:serialize)
        result[:aggregationRule] = aggregation_rule.serialize
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cluster_role
    end
  end
end
