module KubeDSL::DSL::Policy
  class PodDisruptionBudgetList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Policy::PodDisruptionBudget.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

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
  end
end
