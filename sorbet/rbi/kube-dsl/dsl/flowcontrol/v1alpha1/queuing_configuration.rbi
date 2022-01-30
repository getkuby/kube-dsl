# typed: strict

module KubeDSL::DSL::Flowcontrol::V1alpha1
  class QueuingConfiguration < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def hand_size(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def queue_length_limit(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def queues(val = nil); end

  end
end
