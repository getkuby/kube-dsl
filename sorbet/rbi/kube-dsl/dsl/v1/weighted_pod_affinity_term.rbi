# typed: strict

module KubeDSL::DSL::V1
  class WeightedPodAffinityTerm < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::PodAffinityTerm) }
    def pod_affinity_term; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def weight(val = nil); end

  end
end
