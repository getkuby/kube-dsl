module KubeDSL::DSL::Policy::V1beta1
  class PodDisruptionBudgetList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudget.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1beta1"
        result[:kind] = "PodDisruptionBudgetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_disruption_budget_list
    end
  end
end
