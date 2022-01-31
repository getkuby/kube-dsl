# typed: strict

module KubeDSL::DSL::Networking::V1
  class IngressBackend < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
    def resource; end

    sig { returns(KubeDSL::DSL::Networking::V1::IngressServiceBackend) }
    def service; end

  end
end
