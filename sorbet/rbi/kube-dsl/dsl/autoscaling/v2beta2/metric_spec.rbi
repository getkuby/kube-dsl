# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class MetricSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricSource).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricSource) }
          def container_resource(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def container_resource_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricSource).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricSource) }
          def external(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def external_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricSource).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricSource) }
          def object(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def object_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricSource).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricSource) }
          def pods(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def pods_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricSource).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricSource) }
          def resource(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def resource_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def type(val = nil); end
        end
      end
    end
  end
end