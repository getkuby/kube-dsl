module KubeDSL::DSL::Policy::V1beta1
  class PodDisruptionBudget < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudgetSpec.new }
    object_field(:status) { KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudgetStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1beta1"
        result[:kind] = "PodDisruptionBudget"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :pod_disruption_budget
    end
  end
end
