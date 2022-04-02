# typed: strict

module KubeDSL
  module DSL
    module V1
      class StorageOSPersistentVolumeSource < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_namespace(val = nil); end
      end
    end
  end
end