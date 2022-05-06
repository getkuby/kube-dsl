# typed: true

module KubeDSL
  module DSL
    module V1
      class WeightedPodAffinityTerm < ::KubeDSL::DSLObject
        object_field(:pod_affinity_term) { KubeDSL::DSL::V1::PodAffinityTerm.new }
        value_field :weight

        validates :pod_affinity_term, object: { kind_of: KubeDSL::DSL::V1::PodAffinityTerm }
        validates :weight, field: { format: :integer }, presence: false

        def serialize
          {}.tap do |result|
            result[:podAffinityTerm] = pod_affinity_term.serialize
            result[:weight] = weight
          end
        end

        def kind_sym
          :weighted_pod_affinity_term
        end
      end
    end
  end
end