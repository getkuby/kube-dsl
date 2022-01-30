# typed: strict

module KubeDSL::DSL::Apps::V1beta2
  class ScaleStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def replicas(val = nil); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def selector(&block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def target_selector(val = nil); end

  end
end
