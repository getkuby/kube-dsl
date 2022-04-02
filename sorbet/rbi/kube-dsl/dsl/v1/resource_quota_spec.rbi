# typed: strict

module KubeDSL
  module DSL
    module V1
      class ResourceQuotaSpec < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def hard(&block); end

        sig { returns(KubeDSL::DSL::V1::ScopeSelector) }
        def scope_selector; end

        sig { params(val: T.nilable(String)).returns(String) }
        def scopes(val = nil); end
      end
    end
  end
end