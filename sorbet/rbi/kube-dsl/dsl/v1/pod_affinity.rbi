# typed: strict

module KubeDSL
  module DSL
    module V1
      class PodAffinity < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::WeightedPodAffinityTerm))
          ).returns(T::Array[KubeDSL::DSL::V1::WeightedPodAffinityTerm])
        }
        def preferred_during_scheduling_ignored_during_executions(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodAffinityTerm))
          ).returns(T::Array[KubeDSL::DSL::V1::PodAffinityTerm])
        }
        def required_during_scheduling_ignored_during_executions(elem_name = nil, &block); end
      end
    end
  end
end