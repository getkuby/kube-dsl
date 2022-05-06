# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
          extend KubeDSL::ValueFields::ClassMethods
          extend KubeDSL::Validations::ClassMethods
          include KubeDSL::ValueFields::InstanceMethods

          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerCondition))
            ).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerCondition])
          }
          def conditions(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricStatus))
            ).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::MetricStatus])
          }
          def current_metrics(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_replicas(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_replicas(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def last_scale_time(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end
        end
      end
    end
  end
end