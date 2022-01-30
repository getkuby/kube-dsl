# typed: strict

module KubeDSL::DSL::V1
  class VolumeMount < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def mount_path(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def mount_propagation(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def sub_path(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def sub_path_expr(val = nil); end

  end
end
