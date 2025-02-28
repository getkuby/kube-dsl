# typed: strict

module KubeDSL
  module DSL
    module V1
      class Affinity < ::KubeDSL::DSLObject
        extend KubeDSL::ValueFields::ClassMethods
        extend KubeDSL::Validations::ClassMethods
        include KubeDSL::ValueFields::InstanceMethods

        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NodeAffinity).void)).returns(KubeDSL::DSL::V1::NodeAffinity) }
        def node_affinity(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def node_affinity_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::PodAffinity).void)).returns(KubeDSL::DSL::V1::PodAffinity) }
        def pod_affinity(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def pod_affinity_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::PodAntiAffinity).void)).returns(KubeDSL::DSL::V1::PodAntiAffinity) }
        def pod_anti_affinity(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def pod_anti_affinity_present?; end
      end
    end
  end
end