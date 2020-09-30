module KubeDSL::DSL::Scheduling::V1
  class PriorityClass < ::KubeDSL::DSLObject
    value_field :description
    value_field :global_default
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    value_field :preemption_policy
    value_field :value

    validates :description, field: { format: :string }, presence: false
    validates :global_default, field: { format: :boolean }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :preemption_policy, field: { format: :string }, presence: false
    validates :value, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "scheduling.k8s.io/v1"
        result[:description] = description
        result[:globalDefault] = global_default
        result[:kind] = "PriorityClass"
        result[:metadata] = metadata.serialize
        result[:preemptionPolicy] = preemption_policy
        result[:value] = value
      end
    end

    def kind_sym
      :priority_class
    end
  end
end
