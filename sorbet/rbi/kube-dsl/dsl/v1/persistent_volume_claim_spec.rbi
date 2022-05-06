# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source_ref; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def selector; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def storage_class_name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volume_mode(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end
      end
    end
  end
end