module KubeDSL::DSL::Rbac::V1beta1
  class AggregationRule
    extend ::KubeDSL::ValueFields

    array_field(:cluster_role_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:clusterRoleSelectors] = cluster_role_selectors.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :aggregation_rule
    end
  end
end
