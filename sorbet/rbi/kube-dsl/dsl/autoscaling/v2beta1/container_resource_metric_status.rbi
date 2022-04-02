# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class ContainerResourceMetricStatus < ::KubeDSL::DSLObject
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

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end
      end
    end
  end
end