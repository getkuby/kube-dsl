# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class MetricSpec < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricSource) }
          def container_resource; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricSource) }
          def external; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricSource) }
          def object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricSource) }
          def pods; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricSource) }
          def resource; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end
  end
end