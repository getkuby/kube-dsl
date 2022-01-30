# typed: strict

module KubeDSL::DSL::Extensions::V1beta1
  class IngressSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Extensions::V1beta1::IngressBackend) }
    def backend; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Extensions::V1beta1::IngressRule))
      ).returns(T::Array[KubeDSL::DSL::Extensions::V1beta1::IngressRule])
    }
    def rules(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Extensions::V1beta1::IngressTLS))
      ).returns(T::Array[KubeDSL::DSL::Extensions::V1beta1::IngressTLS])
    }
    def tlses(elem_name = nil, &block); end

  end
end
