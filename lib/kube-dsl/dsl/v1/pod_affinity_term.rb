module KubeDSL::DSL::V1
  class PodAffinityTerm < ::KubeDSL::DSLObject
    value_fields :topology_key
    array_field :namespace
    object_field(:label_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:topologyKey] = topology_key
        result[:namespaces] = namespaces
        result[:labelSelector] = label_selector.serialize
      end
    end

    def kind_sym
      :pod_affinity_term
    end
  end
end
