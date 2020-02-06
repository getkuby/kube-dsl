module KubeDSL::DSL
  class WeightedPodAffinityTerm
    extend ::KubeDSL::ValueFields

    value_fields :weight
    object_field(:pod_affinity_term) { KubeDSL::DSL::PodAffinityTerm.new }

    def serialize
      {}.tap do |result|
        result[:weight] = weight
        result[:podAffinityTerm] = pod_affinity_term.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :weighted_pod_affinity_term
    end
  end
end
