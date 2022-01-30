# typed: strict

module KubeDSL::DSL::Networking::V1beta1
  class IngressBackend < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def service_name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def service_port(val = nil); end

  end
end
