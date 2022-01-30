# typed: strict

module KubeDSL::DSL::V1
  class GlusterfsPersistentVolumeSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def endpoints(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def endpoints_namespace(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def path(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only(val = nil); end

  end
end
