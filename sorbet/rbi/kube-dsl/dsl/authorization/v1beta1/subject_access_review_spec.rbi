# typed: strict

module KubeDSL::DSL::Authorization::V1beta1
  class SubjectAccessReviewSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def extra(&block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def group(val = nil); end

    sig { returns(KubeDSL::DSL::Authorization::V1beta1::NonResourceAttributes) }
    def non_resource_attributes; end

    sig { returns(KubeDSL::DSL::Authorization::V1beta1::ResourceAttributes) }
    def resource_attributes; end

    sig { params(val: T.nilable(String)).returns(String) }
    def uid(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def user(val = nil); end

  end
end
