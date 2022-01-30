# typed: strict

module KubeDSL::DSL::V1
  class ISCSIPersistentVolumeSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def chap_auth_discovery(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def chap_auth_session(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def fs_type(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def initiator_name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def iqn(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def iscsi_interface(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def lun(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def portals(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only(val = nil); end

    sig { returns(KubeDSL::DSL::V1::SecretReference) }
    def secret_ref; end

    sig { params(val: T.nilable(String)).returns(String) }
    def target_portal(val = nil); end

  end
end
