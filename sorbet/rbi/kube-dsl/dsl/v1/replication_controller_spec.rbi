# typed: strict

module KubeDSL::DSL::V1
  class ReplicationControllerSpec < ::KubeDSL::DSLObject
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

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def selector(&block); end

    sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
    def template; end

  end
end
