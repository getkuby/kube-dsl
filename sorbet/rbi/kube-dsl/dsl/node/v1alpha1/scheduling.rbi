# typed: strict

module KubeDSL::DSL::Node::V1alpha1
  class Scheduling < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def node_selector(&block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Toleration))
      ).returns(T::Array[KubeDSL::DSL::V1::Toleration])
    }
    def tolerations(elem_name = nil, &block); end

  end
end
