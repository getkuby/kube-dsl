# typed: strict

module KubeDSL::DSL::Node::V1beta1
  class RuntimeClass < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def handler(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

    sig { returns(KubeDSL::DSL::Node::V1beta1::Overhead) }
    def overhead; end

    sig { returns(KubeDSL::DSL::Node::V1beta1::Scheduling) }
    def scheduling; end

  end
end
