# typed: strict

module KubeDSL::DSL::Apiextensions::V1
  class WebhookConversion < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig) }
    def client_config; end

    sig { params(val: T.nilable(String)).returns(String) }
    def conversion_review_versions(val = nil); end

  end
end
