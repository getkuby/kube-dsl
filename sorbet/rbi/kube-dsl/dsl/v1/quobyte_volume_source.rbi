# typed: strict

module KubeDSL::DSL::V1
  class QuobyteVolumeSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def group(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def registry(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def tenant(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def user(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def volume(val = nil); end

  end
end
