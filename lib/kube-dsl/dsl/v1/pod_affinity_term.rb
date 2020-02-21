module KubeDSL::DSL::V1
  class PodAffinityTerm
    extend ::KubeDSL::ValueFields

    value_fields :topology_key
    array_field :namespace
    object_field(:label_selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:topologyKey] = topology_key
        result[:namespaces] = namespaces
        result[:labelSelector] = label_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_affinity_term
    end
  end
end
