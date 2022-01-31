# typed: strict

module KubeDSL::DSL::Flowcontrol::V1beta1
  class LimitedPriorityLevelConfiguration < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def assured_concurrency_shares(val = nil); end

    sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::LimitResponse) }
    def limit_response; end

  end
end
