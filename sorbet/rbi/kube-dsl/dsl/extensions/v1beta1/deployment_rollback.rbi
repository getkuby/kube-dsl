# typed: strict

module KubeDSL::DSL::Extensions::V1beta1
  class DeploymentRollback < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { returns(KubeDSL::DSL::Extensions::V1beta1::RollbackConfig) }
    def rollback_to; end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def updated_annotations(&block); end

  end
end
