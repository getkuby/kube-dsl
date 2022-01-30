# typed: strict

module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionVersion < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceColumnDefinition))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceColumnDefinition])
    }
    def additional_printer_columns(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceValidation) }
    def schema; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def served(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def storage(val = nil); end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresources) }
    def subresources; end

  end
end
