# typed: strict

module KubeDSL::DSL::Auditregistration::V1alpha1
  class WebhookThrottleConfig < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def burst(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def qps(val = nil); end

  end
end
