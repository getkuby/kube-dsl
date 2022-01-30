# typed: strict

module KubeDSL::DSL::V1
  class ConfigMap < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def binary_data(&block); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def data(&block); end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

  end
end