# typed: strict

module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicySpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyEgressRule))
      ).returns(T::Array[KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyEgressRule])
    }
    def egresses(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyIngressRule))
      ).returns(T::Array[KubeDSL::DSL::Extensions::V1beta1::NetworkPolicyIngressRule])
    }
    def ingresses(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def pod_selector; end

    sig { params(val: T.nilable(String)).returns(String) }
    def policy_types(val = nil); end

  end
end
