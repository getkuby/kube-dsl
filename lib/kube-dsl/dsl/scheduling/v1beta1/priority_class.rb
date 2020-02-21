module KubeDSL::DSL::Scheduling::V1beta1
  class PriorityClass
    extend ::KubeDSL::ValueFields

    value_fields :description, :global_default, :preemption_policy, :value
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
