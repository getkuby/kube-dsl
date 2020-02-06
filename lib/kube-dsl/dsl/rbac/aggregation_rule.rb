module KubeDSL::DSL::Rbac
  class AggregationRule
    extend ::KubeDSL::ValueFields
    array_field(:cluster_role_selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:clusterRoleSelectors] = cluster_role_selectors.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
