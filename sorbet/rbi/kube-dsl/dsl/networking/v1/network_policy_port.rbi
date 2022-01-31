# typed: strict

module KubeDSL::DSL::Networking::V1
  class NetworkPolicyPort < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def end_port(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def port(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def protocol(val = nil); end

  end
end
