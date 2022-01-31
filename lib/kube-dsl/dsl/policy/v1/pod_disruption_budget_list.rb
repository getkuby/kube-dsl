# typed: true

module KubeDSL::DSL::Policy::V1
  class PodDisruptionBudgetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Policy::V1::PodDisruptionBudget.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Policy::V1::PodDisruptionBudget }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "PodDisruptionBudgetList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :pod_disruption_budget_list
    end
  end
end
