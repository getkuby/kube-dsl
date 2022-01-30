# typed: strict

module KubeDSL::DSL::Discovery::V1beta1
  class EndpointSlice < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def address_type(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1beta1::Endpoint))
      ).returns(T::Array[KubeDSL::DSL::Discovery::V1beta1::Endpoint])
    }
    def endpoints(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1beta1::EndpointPort))
      ).returns(T::Array[KubeDSL::DSL::Discovery::V1beta1::EndpointPort])
    }
    def ports(elem_name = nil, &block); end

  end
end
