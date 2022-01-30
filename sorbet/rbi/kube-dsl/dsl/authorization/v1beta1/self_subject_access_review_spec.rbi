# typed: strict

module KubeDSL::DSL::Authorization::V1beta1
  class SelfSubjectAccessReviewSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Authorization::V1beta1::NonResourceAttributes) }
    def non_resource_attributes; end

    sig { returns(KubeDSL::DSL::Authorization::V1beta1::ResourceAttributes) }
    def resource_attributes; end

  end
end
