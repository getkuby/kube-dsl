# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class HorizontalPodAutoscalerBehavior < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2::HPAScalingRules).void)).returns(KubeDSL::DSL::Autoscaling::V2::HPAScalingRules) }
          def scale_down(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def scale_down_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2::HPAScalingRules).void)).returns(KubeDSL::DSL::Autoscaling::V2::HPAScalingRules) }
          def scale_up(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def scale_up_present?; end
        end
      end
    end
  end
end