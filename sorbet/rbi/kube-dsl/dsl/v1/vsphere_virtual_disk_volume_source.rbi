# typed: strict

module KubeDSL
  module DSL
    module V1
      class VsphereVirtualDiskVolumeSource < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def fs_type(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def storage_policy_id(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def storage_policy_name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def volume_path(val = nil); end
      end
    end
  end
end