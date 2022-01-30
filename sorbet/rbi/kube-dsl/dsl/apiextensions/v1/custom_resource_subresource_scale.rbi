# typed: strict

module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceSubresourceScale < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def label_selector_path(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def spec_replicas_path(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def status_replicas_path(val = nil); end

  end
end
