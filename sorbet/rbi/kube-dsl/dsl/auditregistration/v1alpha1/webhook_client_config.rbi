# typed: strict

module KubeDSL::DSL::Auditregistration::V1alpha1
  class WebhookClientConfig < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def ca_bundle(val = nil); end

    sig { returns(KubeDSL::DSL::Auditregistration::V1alpha1::ServiceReference) }
    def service; end

    sig { params(val: T.nilable(String)).returns(String) }
    def url(val = nil); end

  end
end
