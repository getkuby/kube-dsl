module KubeDSL::DSL::Scheduling
  class PriorityClass
    extend ::KubeDSL::ValueFields

    value_fields :description, :global_default, :preemption_policy, :value
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "scheduling.k8s.io/v1beta1"
        result[:kind] = "PriorityClass"
        result[:description] = description
        result[:globalDefault] = global_default
        result[:preemptionPolicy] = preemption_policy
        result[:value] = value
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_class
    end
  end
end
