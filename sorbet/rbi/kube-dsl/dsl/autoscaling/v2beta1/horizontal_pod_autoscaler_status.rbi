# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta1
  class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerCondition))
      ).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerCondition])
    }
    def conditions(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::MetricStatus))
      ).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::MetricStatus])
    }
    def current_metrics(elem_name = nil, &block); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def current_replicas(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def desired_replicas(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def last_scale_time(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def observed_generation(val = nil); end

  end
end
