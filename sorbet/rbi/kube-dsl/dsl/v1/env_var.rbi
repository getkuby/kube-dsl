# typed: strict

module KubeDSL
  module DSL
    module V1
      class EnvVar < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::EnvVarSource) }
        def value_from; end
      end
    end
  end
end