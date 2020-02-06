module KubeDSL::DSL::Policy
  class PodDisruptionBudgetSpec
    extend ::KubeDSL::ValueFields
    value_fields :max_unavailable, :min_available
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
        result[:minAvailable] = min_available
        result[:selector] = selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
