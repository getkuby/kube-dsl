# typed: strict

module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceConversion < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def conversion_review_versions(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def strategy(val = nil); end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::WebhookClientConfig) }
    def webhook_client_config; end

  end
end
