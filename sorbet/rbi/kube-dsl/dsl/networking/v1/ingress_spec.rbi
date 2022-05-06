# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressSpec < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Networking::V1::IngressBackend) }
          def default_backend; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def ingress_class_name(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::IngressRule))
            ).returns(T::Array[KubeDSL::DSL::Networking::V1::IngressRule])
          }
          def rules(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::IngressTLS))
            ).returns(T::Array[KubeDSL::DSL::Networking::V1::IngressTLS])
          }
          def tlses(elem_name = nil, &block); end
        end
      end
    end
  end
end