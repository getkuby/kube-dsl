# typed: strict

module KubeDSL::DSL::V1
  class NodeConfigStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
    def active; end

    sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
    def assigned; end

    sig { params(val: T.nilable(String)).returns(String) }
    def error(val = nil); end

    sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
    def last_known_good; end

  end
end
