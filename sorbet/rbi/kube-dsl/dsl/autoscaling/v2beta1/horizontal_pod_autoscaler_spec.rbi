# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta1
  class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def max_replicas(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::MetricSpec))
      ).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::MetricSpec])
    }
    def metrics(elem_name = nil, &block); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min_replicas(val = nil); end

    sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference) }
    def scale_target_ref; end

  end
end
