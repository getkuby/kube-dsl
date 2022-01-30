# typed: strict

module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionNames < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def categories(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def kind(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def list_kind(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def plural(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def short_names(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def singular(val = nil); end

  end
end
