module KubeDSL::DSL
  class TopologySpreadConstraint
    extend ::KubeDSL::ValueFields

    value_fields :max_skew, :topology_key, :when_unsatisfiable
    object_field(:label_selector) { KubeDSL::DSL::Meta::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:maxSkew] = max_skew
        result[:topologyKey] = topology_key
        result[:whenUnsatisfiable] = when_unsatisfiable
        result[:labelSelector] = label_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :topology_spread_constraint
    end
  end
end
