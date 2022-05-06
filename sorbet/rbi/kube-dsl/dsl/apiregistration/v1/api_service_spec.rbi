# typed: strict

module KubeDSL
  module DSL
    module Apiregistration
      module V1
        class APIServiceSpec < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def ca_bundle(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def group(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def group_priority_minimum(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def insecure_skip_tls_verify(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiregistration::V1::ServiceReference) }
          def service; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def version(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def version_priority(val = nil); end
        end
      end
    end
  end
end