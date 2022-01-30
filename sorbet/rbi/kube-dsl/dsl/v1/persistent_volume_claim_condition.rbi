# typed: strict

module KubeDSL::DSL::V1
  class PersistentVolumeClaimCondition < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def last_probe_time(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def last_transition_time(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def message(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reason(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def status(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

  end
end