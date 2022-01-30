# typed: strict

module KubeDSL::DSL::Admissionregistration::V1beta1
  class MutatingWebhook < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def admission_review_versions(val = nil); end

    sig { returns(KubeDSL::DSL::Admissionregistration::V1beta1::WebhookClientConfig) }
    def client_config; end

    sig { params(val: T.nilable(String)).returns(String) }
    def failure_policy(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def match_policy(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def namespace_selector; end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def object_selector; end

    sig { params(val: T.nilable(String)).returns(String) }
    def reinvocation_policy(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1beta1::RuleWithOperations))
      ).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1beta1::RuleWithOperations])
    }
    def rules(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def side_effects(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def timeout_seconds(val = nil); end

  end
end
