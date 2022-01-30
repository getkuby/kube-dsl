# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta2
  class PodsMetricSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
    def metric; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
    def target; end

  end
end
