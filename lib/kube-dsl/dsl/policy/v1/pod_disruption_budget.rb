module KubeDSL::DSL::Policy::V1
  class PodDisruptionBudget < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Policy::V1::PodDisruptionBudgetSpec.new }
    object_field(:status) { KubeDSL::DSL::Policy::V1::PodDisruptionBudgetStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Policy::V1::PodDisruptionBudgetSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Policy::V1::PodDisruptionBudgetStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1"
        result[:kind] = "PodDisruptionBudget"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :pod_disruption_budget
    end
  end
end
