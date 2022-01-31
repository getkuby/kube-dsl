# typed: strict

module KubeDSL::DSL::Policy::V1
  class PodDisruptionBudgetStatus < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::Condition))
      ).returns(T::Array[KubeDSL::DSL::Meta::V1::Condition])
    }
    def conditions(elem_name = nil, &block); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def current_healthy(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def desired_healthy(val = nil); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def disrupted_pods(&block); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def disruptions_allowed(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def expected_pods(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def observed_generation(val = nil); end

  end
end
