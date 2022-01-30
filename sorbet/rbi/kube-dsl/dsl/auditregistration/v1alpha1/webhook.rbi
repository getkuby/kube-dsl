# typed: strict

module KubeDSL::DSL::Auditregistration::V1alpha1
  class Webhook < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Auditregistration::V1alpha1::WebhookClientConfig) }
    def client_config; end

    sig { returns(KubeDSL::DSL::Auditregistration::V1alpha1::WebhookThrottleConfig) }
    def throttle; end

  end
end
