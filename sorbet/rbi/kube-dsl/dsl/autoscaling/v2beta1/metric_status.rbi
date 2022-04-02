# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta1
        class MetricStatus < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ContainerResourceMetricStatus) }
          def container_resource; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricStatus) }
          def external; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricStatus) }
          def object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricStatus) }
          def pods; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricStatus) }
          def resource; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end
  end
end