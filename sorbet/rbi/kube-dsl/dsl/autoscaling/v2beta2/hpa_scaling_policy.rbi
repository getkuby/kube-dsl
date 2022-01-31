# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta2
  class HPAScalingPolicy < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def period_seconds(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def value(val = nil); end

  end
end
