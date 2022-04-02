# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class ContainerResourceMetricSource < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def container(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
          def target; end
        end
      end
    end
  end
end