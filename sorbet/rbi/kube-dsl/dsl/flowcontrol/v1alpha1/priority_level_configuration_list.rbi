# typed: strict

module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationList < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfiguration))
      ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfiguration])
    }
    def items(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
    def metadata; end

  end
end