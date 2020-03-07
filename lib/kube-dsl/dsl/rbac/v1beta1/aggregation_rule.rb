module KubeDSL::DSL::Rbac::V1beta1
  class AggregationRule < ::KubeDSL::DSLObject
    array_field(:cluster_role_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:clusterRoleSelectors] = cluster_role_selectors.map(&:serialize)
      end
    end

    def kind_sym
      :aggregation_rule
    end
  end
end
