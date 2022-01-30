# typed: strict

module KubeDSL::DSL::Networking::V1
  class NetworkPolicyPeer < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Networking::V1::IPBlock) }
    def ip_block; end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def namespace_selector; end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def pod_selector; end

  end
end
