# typed: strict

module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceSubresources < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::CustomResourceSubresourceScale) }
    def scale; end

    sig { params(val: T.nilable(String)).returns(String) }
    def status(val = nil); end

  end
end