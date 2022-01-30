# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta1
  class MetricSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricSource) }
    def external; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricSource) }
    def object; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricSource) }
    def pods; end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricSource) }
    def resource; end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

  end
end
