# typed: strict

module KubeDSL::DSL::V1
  class EnvFromSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::ConfigMapEnvSource) }
    def config_map_ref; end

    sig { params(val: T.nilable(String)).returns(String) }
    def prefix(val = nil); end

    sig { returns(KubeDSL::DSL::V1::SecretEnvSource) }
    def secret_ref; end

  end
end
