# typed: strict

module KubeDSL::DSL::V1
  class NodeAffinity < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PreferredSchedulingTerm))
      ).returns(T::Array[KubeDSL::DSL::V1::PreferredSchedulingTerm])
    }
    def preferred_during_scheduling_ignored_during_executions(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::V1::NodeSelector) }
    def required_during_scheduling_ignored_during_execution; end

  end
end
