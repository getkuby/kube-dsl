# typed: strict

module KubeDSL::DSL::V1
  class VolumeProjection < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::ConfigMapProjection) }
    def config_map; end

    sig { returns(KubeDSL::DSL::V1::DownwardAPIProjection) }
    def downward_api; end

    sig { returns(KubeDSL::DSL::V1::SecretProjection) }
    def secret; end

    sig { returns(KubeDSL::DSL::V1::ServiceAccountTokenProjection) }
    def service_account_token; end

  end
end
