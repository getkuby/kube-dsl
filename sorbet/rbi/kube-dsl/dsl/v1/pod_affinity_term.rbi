# typed: strict

module KubeDSL::DSL::V1
  class PodAffinityTerm < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def label_selector; end

    sig { params(val: T.nilable(String)).returns(String) }
    def namespaces(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def topology_key(val = nil); end

  end
end
