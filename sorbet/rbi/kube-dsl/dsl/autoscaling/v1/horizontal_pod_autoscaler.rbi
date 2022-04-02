# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V1
        class HorizontalPodAutoscaler < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end



          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerStatus) }
          def status; end
        end
      end
    end
  end
end