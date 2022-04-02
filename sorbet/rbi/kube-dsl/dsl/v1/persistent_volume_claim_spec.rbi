# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source; end

        sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source_ref; end

        sig { returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources; end

        sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def selector; end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_class_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end
      end
    end
  end
end