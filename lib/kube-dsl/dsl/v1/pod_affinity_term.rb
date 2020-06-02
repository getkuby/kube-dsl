module KubeDSL::DSL::V1
  class PodAffinityTerm < ::KubeDSL::DSLObject
    value_fields :namespaces, :topology_key
    object_field(:label_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def serialize
      {}.tap do |result|
        result[:namespaces] = namespaces
        result[:topologyKey] = topology_key
        result[:labelSelector] = label_selector.serialize
      end
    end

    def kind_sym
      :pod_affinity_term
    end
  end
end
