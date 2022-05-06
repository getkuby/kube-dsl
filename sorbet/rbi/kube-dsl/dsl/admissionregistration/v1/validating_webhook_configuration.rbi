# typed: strict

module KubeDSL
  module DSL
    module Admissionregistration
      module V1
        class ValidatingWebhookConfiguration < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end



          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook))
            ).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook])
          }
          def webhooks(elem_name = nil, &block); end
        end
      end
    end
  end
end