module KubeDSL::DSL::V1
  class TopologySpreadConstraint < ::KubeDSL::DSLObject
    value_fields :max_skew, :topology_key, :when_unsatisfiable
    object_field(:label_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:maxSkew] = max_skew
        result[:topologyKey] = topology_key
        result[:whenUnsatisfiable] = when_unsatisfiable
        result[:labelSelector] = label_selector.serialize
      end
    end

    def kind
      :topology_spread_constraint
    end
  end
end
