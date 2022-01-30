# typed: strict

module KubeDSL::DSL::V1
  class PodDNSConfig < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def nameservers(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodDNSConfigOption))
      ).returns(T::Array[KubeDSL::DSL::V1::PodDNSConfigOption])
    }
    def options(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def searches(val = nil); end

  end
end
