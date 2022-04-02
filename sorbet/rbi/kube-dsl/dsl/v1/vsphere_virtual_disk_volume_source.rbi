# typed: strict

module KubeDSL
  module DSL
    module V1
      class VsphereVirtualDiskVolumeSource < ::KubeDSL::DSLObject
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

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_policy_id(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_policy_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_path(val = nil); end
      end
    end
  end
end