# typed: strict

module KubeDSL
  module DSL
    module V1
      class EnvFromSource < ::KubeDSL::DSLObject
        extend KubeDSL::ValueFields::ClassMethods
        extend KubeDSL::Validations::ClassMethods
        include KubeDSL::ValueFields::InstanceMethods

        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ConfigMapEnvSource).void)).returns(KubeDSL::DSL::V1::ConfigMapEnvSource) }
        def config_map_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def config_map_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def prefix(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecretEnvSource).void)).returns(KubeDSL::DSL::V1::SecretEnvSource) }
        def secret_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def secret_ref_present?; end
      end
    end
  end
end