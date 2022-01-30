# typed: strict

module KubeDSL::DSL::Meta::V1
  class StatusCause < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def field(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def message(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reason(val = nil); end

  end
end
