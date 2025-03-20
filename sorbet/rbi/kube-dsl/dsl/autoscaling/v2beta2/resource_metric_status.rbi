# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class ResourceMetricStatus < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def current_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def name(val = nil); end
        end
      end
    end
  end
end