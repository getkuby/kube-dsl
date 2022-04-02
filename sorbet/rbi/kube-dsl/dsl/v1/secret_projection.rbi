# typed: strict

module KubeDSL
  module DSL
    module V1
      class SecretProjection < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::KeyToPath))
          ).returns(T::Array[KubeDSL::DSL::V1::KeyToPath])
        }
        def items(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end
    end
  end
end