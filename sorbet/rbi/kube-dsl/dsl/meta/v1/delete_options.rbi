# typed: strict

module KubeDSL::DSL::Meta::V1
  class DeleteOptions < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def api_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def dry_run(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def grace_period_seconds(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def orphan_dependents(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::Preconditions) }
    def preconditions; end

    sig { params(val: T.nilable(String)).returns(String) }
    def propagation_policy(val = nil); end

  end
end
