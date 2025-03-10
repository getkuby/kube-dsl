# typed: strict

module KubeDSL
  module DSL
    module V1
      class VolumeProjection < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ConfigMapProjection).void)).returns(KubeDSL::DSL::V1::ConfigMapProjection) }
        def config_map(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def config_map_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::DownwardAPIProjection).void)).returns(KubeDSL::DSL::V1::DownwardAPIProjection) }
        def downward_api(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def downward_api_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecretProjection).void)).returns(KubeDSL::DSL::V1::SecretProjection) }
        def secret(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def secret_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ServiceAccountTokenProjection).void)).returns(KubeDSL::DSL::V1::ServiceAccountTokenProjection) }
        def service_account_token(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def service_account_token_present?; end
      end
    end
  end
end