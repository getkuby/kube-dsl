# typed: strict

module KubeDSL
  module DSL
    module V1
      class EnvVarSource < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ConfigMapKeySelector) }
        def config_map_key_ref; end

        sig { returns(KubeDSL::DSL::V1::ObjectFieldSelector) }
        def field_ref; end

        sig { returns(KubeDSL::DSL::V1::ResourceFieldSelector) }
        def resource_field_ref; end

        sig { returns(KubeDSL::DSL::V1::SecretKeySelector) }
        def secret_key_ref; end
      end
    end
  end
end