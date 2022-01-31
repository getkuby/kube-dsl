# typed: strict

module KubeDSL::DSL::Flowcontrol::V1beta1
  class PriorityLevelConfigurationSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::LimitedPriorityLevelConfiguration) }
    def limited; end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

  end
end
