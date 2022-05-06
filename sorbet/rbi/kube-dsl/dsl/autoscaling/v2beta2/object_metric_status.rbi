# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class ObjectMetricStatus < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def current_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference) }
          def described_object; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def described_object_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metric_present?; end
        end
      end
    end
  end
end