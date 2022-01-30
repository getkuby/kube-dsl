# typed: strict

module KubeDSL::DSL::V1
  class ContainerImage < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def names(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def size_bytes(val = nil); end

  end
end
