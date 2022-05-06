# typed: strict

module KubeDSL
  module DSL
    module V1
      class Affinity < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeAffinity) }
        def node_affinity; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PodAffinity) }
        def pod_affinity; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PodAntiAffinity) }
        def pod_anti_affinity; end
      end
    end
  end
end