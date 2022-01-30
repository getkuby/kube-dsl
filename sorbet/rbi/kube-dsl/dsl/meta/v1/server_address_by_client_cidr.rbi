# typed: strict

module KubeDSL::DSL::Meta::V1
  class ServerAddressByClientCIDR < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def client_cidr(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def server_address(val = nil); end

  end
end