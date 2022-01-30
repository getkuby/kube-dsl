# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta2
  class ObjectMetricStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
    def current; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference) }
    def described_object; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
    def metric; end

  end
end
