module KubeDSL::DSL::V1
  class WeightedPodAffinityTerm < ::KubeDSL::DSLObject
    value_fields :weight
    object_field(:pod_affinity_term) { KubeDSL::DSL::V1::PodAffinityTerm.new }

    def serialize
      {}.tap do |result|
        result[:weight] = weight
        result[:podAffinityTerm] = pod_affinity_term.serialize
      end
    end

    def kind_sym
      :weighted_pod_affinity_term
    end
  end
end
