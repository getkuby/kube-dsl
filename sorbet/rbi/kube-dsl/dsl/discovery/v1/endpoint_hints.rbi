# typed: strict

module KubeDSL::DSL::Discovery::V1
  class EndpointHints < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1::ForZone))
      ).returns(T::Array[KubeDSL::DSL::Discovery::V1::ForZone])
    }
    def for_zones(elem_name = nil, &block); end

  end
end
