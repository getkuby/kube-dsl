module KubeDSL::DSL::Scheduling::V1alpha1
  class PriorityClass < ::KubeDSL::DSLObject
    value_fields :description, :global_default, :preemption_policy, :value
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "scheduling.k8s.io/v1alpha1"
        result[:kind] = "PriorityClass"
        result[:description] = description
        result[:globalDefault] = global_default
        result[:preemptionPolicy] = preemption_policy
        result[:value] = value
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :priority_class
    end
  end
end
