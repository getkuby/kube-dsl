# typed: strict

module KubeDSL::DSL::Authorization::V1
  class SubjectRulesReviewStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def evaluation_error(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def incomplete(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Authorization::V1::NonResourceRule))
      ).returns(T::Array[KubeDSL::DSL::Authorization::V1::NonResourceRule])
    }
    def non_resource_rules(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Authorization::V1::ResourceRule))
      ).returns(T::Array[KubeDSL::DSL::Authorization::V1::ResourceRule])
    }
    def resource_rules(elem_name = nil, &block); end

  end
end
