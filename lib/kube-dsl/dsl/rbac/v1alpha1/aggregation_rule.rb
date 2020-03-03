module KubeDSL::DSL::Rbac::V1alpha1
  class AggregationRule < ::KubeDSL::DSLObject
    array_field(:cluster_role_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:clusterRoleSelectors] = cluster_role_selectors.map(&:serialize)
      end
    end

    def kind
      :aggregation_rule
    end
  end
end
