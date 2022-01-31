# typed: strict

module KubeDSL::DSL::Discovery::V1
  class EndpointConditions < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def ready(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def serving(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def terminating(val = nil); end

  end
end
