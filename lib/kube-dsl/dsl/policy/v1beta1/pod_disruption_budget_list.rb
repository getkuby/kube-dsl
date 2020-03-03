module KubeDSL::DSL::Policy::V1beta1
  class PodDisruptionBudgetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudget.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1beta1"
        result[:kind] = "PodDisruptionBudgetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :pod_disruption_budget_list
    end
  end
end
