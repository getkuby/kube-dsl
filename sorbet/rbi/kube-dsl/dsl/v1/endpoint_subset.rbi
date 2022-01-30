# typed: strict

module KubeDSL::DSL::V1
  class EndpointSubset < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointAddress))
      ).returns(T::Array[KubeDSL::DSL::V1::EndpointAddress])
    }
    def addresses(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointAddress))
      ).returns(T::Array[KubeDSL::DSL::V1::EndpointAddress])
    }
    def not_ready_addresses(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointPort))
      ).returns(T::Array[KubeDSL::DSL::V1::EndpointPort])
    }
    def ports(elem_name = nil, &block); end

  end
end
