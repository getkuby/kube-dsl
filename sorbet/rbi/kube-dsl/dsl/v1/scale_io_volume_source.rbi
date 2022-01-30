# typed: strict

module KubeDSL::DSL::V1
  class ScaleIOVolumeSource < ::KubeDSL::DSLObject
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
    def gateway(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def protection_domain(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only(val = nil); end

    sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
    def secret_ref; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def ssl_enabled(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def storage_mode(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def storage_pool(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def system(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def volume_name(val = nil); end

  end
end
