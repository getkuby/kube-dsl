# typed: strict

module KubeDSL
  module DSL
    module V1
      class CephFSPersistentVolumeSource < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def monitors(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def secret_file(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def secret_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end
      end
    end
  end
end