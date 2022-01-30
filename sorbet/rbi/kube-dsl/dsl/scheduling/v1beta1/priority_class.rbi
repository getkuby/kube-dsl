# typed: strict

module KubeDSL::DSL::Scheduling::V1beta1
  class PriorityClass < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def description(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def global_default(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

    sig { params(val: T.nilable(String)).returns(String) }
    def preemption_policy(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def value(val = nil); end

  end
end
