# typed: strict

module KubeDSL::DSL::V1
  class CephFSVolumeSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def monitors(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def path(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def secret_file(val = nil); end

    sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
    def secret_ref; end

    sig { params(val: T.nilable(String)).returns(String) }
    def user(val = nil); end

  end
end
