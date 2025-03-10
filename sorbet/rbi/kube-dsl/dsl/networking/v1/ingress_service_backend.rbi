# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressServiceBackend < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Networking::V1::ServiceBackendPort).void)).returns(KubeDSL::DSL::Networking::V1::ServiceBackendPort) }
          def port(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def port_present?; end
        end
      end
    end
  end
end