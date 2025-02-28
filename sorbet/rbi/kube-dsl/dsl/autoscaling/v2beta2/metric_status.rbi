# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V2beta2
        class MetricStatus < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricStatus).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricStatus) }
          def container_resource(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def container_resource_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricStatus).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricStatus) }
          def external(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def external_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricStatus).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricStatus) }
          def object(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def object_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricStatus).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricStatus) }
          def pods(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def pods_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricStatus).void)).returns(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricStatus) }
          def resource(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def resource_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end
  end
end