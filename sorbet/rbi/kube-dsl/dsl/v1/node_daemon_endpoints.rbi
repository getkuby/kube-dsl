# typed: strict

module KubeDSL::DSL::V1
  class NodeDaemonEndpoints < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::DaemonEndpoint) }
    def kubelet_endpoint; end

  end
end
