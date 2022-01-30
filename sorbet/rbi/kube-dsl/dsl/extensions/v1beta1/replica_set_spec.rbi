# typed: strict

module KubeDSL::DSL::Extensions::V1beta1
  class ReplicaSetSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min_ready_seconds(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def replicas(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def selector; end

    sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
    def template; end

  end
end