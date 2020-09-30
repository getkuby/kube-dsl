module KubeDSL::DSL::V1
  class TopologySpreadConstraint < ::KubeDSL::DSLObject
    object_field(:label_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    value_field :max_skew
    value_field :topology_key
    value_field :when_unsatisfiable

    validates :label_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :max_skew, field: { format: :integer }, presence: false
    validates :topology_key, field: { format: :string }, presence: false
    validates :when_unsatisfiable, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:labelSelector] = label_selector.serialize
        result[:maxSkew] = max_skew
        result[:topologyKey] = topology_key
        result[:whenUnsatisfiable] = when_unsatisfiable
      end
    end

    def kind_sym
      :topology_spread_constraint
    end
  end
end
