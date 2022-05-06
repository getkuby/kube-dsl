# typed: strict

module KubeDSL
  module DSL
    module V1
      class NodeAffinity < ::KubeDSL::DSLObject
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
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PreferredSchedulingTerm))
          ).returns(T::Array[KubeDSL::DSL::V1::PreferredSchedulingTerm])
        }
        def preferred_during_scheduling_ignored_during_executions(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeSelector) }
        def required_during_scheduling_ignored_during_execution; end
      end
    end
  end
end