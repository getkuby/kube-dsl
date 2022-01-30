# typed: strict

module KubeDSL::DSL::Policy::V1beta1
  class RunAsGroupStrategyOptions < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::IDRange))
      ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::IDRange])
    }
    def ranges(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def rule(val = nil); end

  end
end
