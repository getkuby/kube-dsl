# typed: strict

module KubeDSL::DSL::Extensions::V1beta1
  class IDRange < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def max(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min(val = nil); end

  end
end
