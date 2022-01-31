# typed: true

module KubeDSL::DSL::V1
  class PodAffinityTerm < ::KubeDSL::DSLObject
    object_field(:label_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:namespace_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    value_field :namespaces
    value_field :topology_key

    validates :label_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :namespace_selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :namespaces, field: { format: :string }, presence: false
    validates :topology_key, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:labelSelector] = label_selector.serialize
        result[:namespaceSelector] = namespace_selector.serialize
        result[:namespaces] = namespaces
        result[:topologyKey] = topology_key
      end
    end

    def kind_sym
      :pod_affinity_term
    end
  end
end
