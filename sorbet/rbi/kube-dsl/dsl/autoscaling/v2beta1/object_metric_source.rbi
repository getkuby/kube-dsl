# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class ObjectMetricSource < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference) }
          def target; end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_value(val = nil); end
        end
      end
    end
  end
end