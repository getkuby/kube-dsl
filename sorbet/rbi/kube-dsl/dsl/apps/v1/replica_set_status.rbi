# typed: strict

module KubeDSL::DSL::Apps::V1
  class ReplicaSetStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def available_replicas(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::ReplicaSetCondition))
      ).returns(T::Array[KubeDSL::DSL::Apps::V1::ReplicaSetCondition])
    }
    def conditions(elem_name = nil, &block); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def fully_labeled_replicas(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def observed_generation(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def ready_replicas(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def replicas(val = nil); end

  end
end
