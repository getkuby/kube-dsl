# typed: strict

module KubeDSL::DSL::Networking::V1beta1
  class HTTPIngressPath < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Networking::V1beta1::IngressBackend) }
    def backend; end

    sig { params(val: T.nilable(String)).returns(String) }
    def path(val = nil); end

  end
end
