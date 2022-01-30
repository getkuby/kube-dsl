# typed: strict

module KubeDSL::DSL::V1
  class ObjectFieldSelector < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def api_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def field_path(val = nil); end

  end
end
