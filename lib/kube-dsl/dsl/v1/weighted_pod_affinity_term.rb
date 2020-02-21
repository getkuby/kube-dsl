module KubeDSL::DSL::V1
  class WeightedPodAffinityTerm
    extend ::KubeDSL::ValueFields

    value_fields :weight
    object_field(:pod_affinity_term) { KubeDSL::DSL::V1::PodAffinityTerm.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
