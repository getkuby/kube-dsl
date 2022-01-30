# typed: strict

module KubeDSL::DSL::Meta::V1
  class StatusDetails < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::StatusCause))
      ).returns(T::Array[KubeDSL::DSL::Meta::V1::StatusCause])
    }
    def causes(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def group(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def kind(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def retry_after_seconds(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def uid(val = nil); end

  end
end