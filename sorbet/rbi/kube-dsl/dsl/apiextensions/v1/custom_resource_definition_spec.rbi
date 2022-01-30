# typed: strict

module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceDefinitionSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion) }
    def conversion; end

    sig { params(val: T.nilable(String)).returns(String) }
    def group(val = nil); end

    sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames) }
    def names; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def preserve_unknown_fields(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def scope(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion])
    }
    def versions(elem_name = nil, &block); end

  end
end
