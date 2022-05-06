# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class HPAScalingRules < ::KubeDSL::DSLObject
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
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingPolicy))
            ).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingPolicy])
          }
          def policies(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def select_policy(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def stabilization_window_seconds(val = nil); end
        end
      end
    end
  end
end