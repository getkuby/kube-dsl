# typed: strict

module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionNames) }
    def accepted_names; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionCondition))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceDefinitionCondition])
    }
    def conditions(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def stored_versions(val = nil); end

  end
end
