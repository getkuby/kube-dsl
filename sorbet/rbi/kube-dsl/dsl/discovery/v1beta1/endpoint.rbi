# typed: strict

module KubeDSL::DSL::Discovery::V1beta1
  class Endpoint < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def addresses(val = nil); end

    sig { returns(KubeDSL::DSL::Discovery::V1beta1::EndpointConditions) }
    def conditions; end

    sig { returns(KubeDSL::DSL::Discovery::V1beta1::EndpointHints) }
    def hints; end

    sig { params(val: T.nilable(String)).returns(String) }
    def hostname(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def node_name(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ObjectReference) }
    def target_ref; end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def topology(&block); end

  end
end
