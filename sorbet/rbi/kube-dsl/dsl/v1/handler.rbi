# typed: strict

module KubeDSL
  module DSL
    module V1
      class Handler < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ExecAction) }
        def exec; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::HTTPGetAction) }
        def http_get; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::TCPSocketAction) }
        def tcp_socket; end
      end
    end
  end
end