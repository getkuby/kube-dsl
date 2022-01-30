# typed: strict

module KubeDSL::DSL::Apiextensions::V1
  class JSON < ::KubeDSL::DSLObject
    JSONType = T.type_alias do
      T.any(
        T::Array[T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped])],
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    end

    sig { params(block: T.nilable(T.proc.void)).void }
    def initialize(&block)
      @value = T.let(@value, JSONType)
    end

    sig { returns(JSONType) }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(JSONType)).returns(JSONType) }
    def value(val = nil); end
  end
end
