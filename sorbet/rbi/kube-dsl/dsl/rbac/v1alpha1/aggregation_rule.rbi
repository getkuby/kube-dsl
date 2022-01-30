# typed: strict

module KubeDSL::DSL::Rbac::V1alpha1
  class AggregationRule < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::LabelSelector))
      ).returns(T::Array[KubeDSL::DSL::Meta::V1::LabelSelector])
    }
    def cluster_role_selectors(elem_name = nil, &block); end

  end
end
