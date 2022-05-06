# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V1
        class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_replicas(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_replicas(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference) }
          def scale_target_ref; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def target_cpu_utilization_percentage(val = nil); end
        end
      end
    end
  end
end