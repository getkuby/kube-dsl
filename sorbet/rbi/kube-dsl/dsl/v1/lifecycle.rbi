# typed: strict

module KubeDSL::DSL::V1
  class Lifecycle < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::Handler) }
    def post_start; end

    sig { returns(KubeDSL::DSL::V1::Handler) }
    def pre_stop; end

  end
end
