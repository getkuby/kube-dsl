# typed: strict

module KubeDSL::DSL::Coordination::V1
  class LeaseSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def acquire_time(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def holder_identity(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def lease_duration_seconds(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def lease_transitions(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def renew_time(val = nil); end

  end
end
