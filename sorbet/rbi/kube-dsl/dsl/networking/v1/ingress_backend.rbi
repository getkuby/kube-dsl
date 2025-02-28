# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressBackend < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::TypedLocalObjectReference).void)).returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
          def resource(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def resource_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Networking::V1::IngressServiceBackend).void)).returns(KubeDSL::DSL::Networking::V1::IngressServiceBackend) }
          def service(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def service_present?; end
        end
      end
    end
  end
end